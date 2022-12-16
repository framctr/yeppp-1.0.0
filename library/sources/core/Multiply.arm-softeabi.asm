@                       Yeppp! library implementation
@                   This file is auto-generated by Peach-Py,
@        Portable Efficient Assembly Code-generator in Higher-level Python,
@                  part of the Yeppp! library infrastructure
@ This file is part of Yeppp! library and licensed under the New BSD license.
@ See LICENSE.txt for the full text of the license.

.macro BEGIN_ARM_FUNCTION name
	.arm
	.globl \name
	.align 2
	.func \name
	.internal \name
	\name:
.endm

.macro END_ARM_FUNCTION name
	.endfunc
	.type \name, %function
	.size \name, .-\name
.endm

.section .text.CortexA9,"ax",%progbits
BEGIN_ARM_FUNCTION _yepCore_Multiply_V64fV64f_V64f_CortexA9
	.arch armv5t
	.fpu vfpv3-d16
L_yepCore_Multiply_V64fV64f_V64f_CortexA9.ENTRY:
	VPUSH {d8, d9, d10, d11, d12, d13, d14, d15}
	TST r0, r0
	BEQ L_yepCore_Multiply_V64fV64f_V64f_CortexA9.return_null_pointer
	TST r0, #7
	BNE L_yepCore_Multiply_V64fV64f_V64f_CortexA9.return_misaligned_pointer
	TST r1, r1
	BEQ L_yepCore_Multiply_V64fV64f_V64f_CortexA9.return_null_pointer
	TST r1, #7
	BNE L_yepCore_Multiply_V64fV64f_V64f_CortexA9.return_misaligned_pointer
	TST r2, r2
	BEQ L_yepCore_Multiply_V64fV64f_V64f_CortexA9.return_null_pointer
	TST r2, #7
	BNE L_yepCore_Multiply_V64fV64f_V64f_CortexA9.return_misaligned_pointer
	SUBS r3, r3, #8
	BLO L_yepCore_Multiply_V64fV64f_V64f_CortexA9.batch_process_finish
L_yepCore_Multiply_V64fV64f_V64f_CortexA9.process_batch_prologue:
	VLDM r0!, {d0, d1}
	VLDM r1!, {d4, d5}
	VLDM r0!, {d6, d7}
	VLDM r1!, {d8, d9}
	VMUL.F64 d0, d0, d4
	VLDM r0!, {d14, d15}
	VLDM r1!, {d2, d3}
	VMUL.F64 d6, d6, d8
	VMUL.F64 d1, d1, d5
	VLDM r0!, {d12, d13}
	VLDM r1!, {d10, d11}
	VMUL.F64 d14, d14, d2
	VMUL.F64 d7, d7, d9
	VSTM r2!, {d0, d1}
	SUBS r3, r3, #8
	BLO L_yepCore_Multiply_V64fV64f_V64f_CortexA9.process_batch_epilogue
L_yepCore_Multiply_V64fV64f_V64f_CortexA9.process_batch:
	VLDM r0!, {d0, d1}
	VLDM r1!, {d4, d5}
	VMUL.F64 d12, d12, d10
	VMUL.F64 d15, d15, d3
	VSTM r2!, {d6, d7}
	VLDM r0!, {d6, d7}
	VLDM r1!, {d8, d9}
	VMUL.F64 d0, d0, d4
	VMUL.F64 d13, d13, d11
	VSTM r2!, {d14, d15}
	VLDM r0!, {d14, d15}
	VLDM r1!, {d2, d3}
	VMUL.F64 d6, d6, d8
	VMUL.F64 d1, d1, d5
	VSTM r2!, {d12, d13}
	VLDM r0!, {d12, d13}
	VLDM r1!, {d10, d11}
	VMUL.F64 d14, d14, d2
	VMUL.F64 d7, d7, d9
	VSTM r2!, {d0, d1}
	SUBS r3, r3, #8
	BHS L_yepCore_Multiply_V64fV64f_V64f_CortexA9.process_batch
L_yepCore_Multiply_V64fV64f_V64f_CortexA9.process_batch_epilogue:
	VMUL.F64 d12, d12, d10
	VMUL.F64 d15, d15, d3
	VSTM r2!, {d6, d7}
	VMUL.F64 d13, d13, d11
	VSTM r2!, {d14, d15}
	VSTM r2!, {d12, d13}
L_yepCore_Multiply_V64fV64f_V64f_CortexA9.batch_process_finish:
	ADDS r3, r3, #8
	BEQ L_yepCore_Multiply_V64fV64f_V64f_CortexA9.return_ok
L_yepCore_Multiply_V64fV64f_V64f_CortexA9.process_single:
	VLDR d0, [r0]
	ADD r0, r0, #8
	VLDR d1, [r1]
	ADD r1, r1, #8
	VMUL.F64 d0, d0, d1
	VSTR d0, [r2]
	ADD r2, r2, #8
	SUBS r3, r3, #1
	BNE L_yepCore_Multiply_V64fV64f_V64f_CortexA9.process_single
L_yepCore_Multiply_V64fV64f_V64f_CortexA9.return_ok:
	MOV r0, #0
L_yepCore_Multiply_V64fV64f_V64f_CortexA9.return:
	VPOP {d8, d9, d10, d11, d12, d13, d14, d15}
	BX lr
L_yepCore_Multiply_V64fV64f_V64f_CortexA9.return_null_pointer:
	MOV r0, #1
	VPOP {d8, d9, d10, d11, d12, d13, d14, d15}
	BX lr
L_yepCore_Multiply_V64fV64f_V64f_CortexA9.return_misaligned_pointer:
	MOV r0, #2
	VPOP {d8, d9, d10, d11, d12, d13, d14, d15}
	BX lr
END_ARM_FUNCTION _yepCore_Multiply_V64fV64f_V64f_CortexA9
