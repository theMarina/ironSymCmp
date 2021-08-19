unsigned int __anvill_reg_ESI = 0U;
unsigned char __anvill_sp = (unsigned char)0U;
unsigned char __anvill_ra = (unsigned char)0U;
unsigned char __anvill_stack_minus_4 = (unsigned char)0U;
unsigned char __anvill_stack_minus_3 = (unsigned char)0U;
unsigned char __anvill_stack_minus_2 = (unsigned char)0U;
unsigned char __anvill_stack_minus_1 = (unsigned char)0U;
unsigned char __anvill_stack_0 = (unsigned char)0U;
unsigned char __anvill_stack_plus_1 = (unsigned char)0U;
unsigned char __anvill_stack_plus_2 = (unsigned char)0U;
unsigned char __anvill_stack_plus_3 = (unsigned char)0U;
unsigned char __anvill_stack_plus_4 = (unsigned char)0U;
unsigned char __anvill_stack_plus_5 = (unsigned char)0U;
unsigned char __anvill_stack_plus_6 = (unsigned char)0U;
unsigned char __anvill_stack_plus_7 = (unsigned char)0U;
unsigned char __anvill_stack_plus_8 = (unsigned char)0U;
unsigned char __anvill_stack_plus_9 = (unsigned char)0U;
unsigned char __anvill_stack_plus_10 = (unsigned char)0U;
unsigned char __anvill_stack_plus_11 = (unsigned char)0U;
unsigned char *rx_brake_routine(unsigned char *arg0, unsigned char *arg1);
struct struct_Memory {
};
struct struct_Memory *__remill_write_memory_32(struct struct_Memory *arg0, unsigned int arg1, unsigned int arg2);
unsigned int __remill_read_memory_32(struct struct_Memory *arg0, unsigned int arg1);
unsigned char *__anvill_type_hint_Sb(unsigned int arg0);
unsigned char __remill_read_memory_8(struct struct_Memory *arg0, unsigned int arg1);
struct struct_Memory *__remill_write_memory_8(struct struct_Memory *arg0, unsigned int arg1, unsigned char arg2);
struct union_anon {
    unsigned long long field0;
};
struct struct_ArchState {
    unsigned int field0;
    unsigned int field1;
    struct union_anon field2;
};
struct struct_uint64v8_t {
    unsigned long long field0[8];
};
struct union_vec512_t {
    struct struct_uint64v8_t field0;
};
struct union_VectorReg {
    struct union_vec512_t field0;
};
struct struct_ArithFlags {
    unsigned char field0;
    unsigned char field1;
    unsigned char field2;
    unsigned char field3;
    unsigned char field4;
    unsigned char field5;
    unsigned char field6;
    unsigned char field7;
    unsigned char field8;
    unsigned char field9;
    unsigned char field10;
    unsigned char field11;
    unsigned char field12;
    unsigned char field13;
    unsigned char field14;
    unsigned char field15;
};
struct union_SegmentSelector {
    unsigned short field0;
};
struct struct_Segments {
    unsigned short field0;
    struct union_SegmentSelector field1;
    unsigned short field2;
    struct union_SegmentSelector field3;
    unsigned short field4;
    struct union_SegmentSelector field5;
    unsigned short field6;
    struct union_SegmentSelector field7;
    unsigned short field8;
    struct union_SegmentSelector field9;
    unsigned short field10;
    struct union_SegmentSelector field11;
};
struct union_anon_1 {
    unsigned int field0;
};
struct struct_Reg {
    struct union_anon_1 field0;
    unsigned int field1;
};
struct struct_AddressSpace {
    unsigned long long field0;
    struct struct_Reg field1;
    unsigned long long field2;
    struct struct_Reg field3;
    unsigned long long field4;
    struct struct_Reg field5;
    unsigned long long field6;
    struct struct_Reg field7;
    unsigned long long field8;
    struct struct_Reg field9;
    unsigned long long field10;
    struct struct_Reg field11;
};
struct struct_GPR {
    unsigned long long field0;
    struct struct_Reg field1;
    unsigned long long field2;
    struct struct_Reg field3;
    unsigned long long field4;
    struct struct_Reg field5;
    unsigned long long field6;
    struct struct_Reg field7;
    unsigned long long field8;
    struct struct_Reg field9;
    unsigned long long field10;
    struct struct_Reg field11;
    unsigned long long field12;
    struct struct_Reg field13;
    unsigned long long field14;
    struct struct_Reg field15;
    unsigned long long field16;
    struct struct_Reg field17;
    unsigned long long field18;
    struct struct_Reg field19;
    unsigned long long field20;
    struct struct_Reg field21;
    unsigned long long field22;
    struct struct_Reg field23;
    unsigned long long field24;
    struct struct_Reg field25;
    unsigned long long field26;
    struct struct_Reg field27;
    unsigned long long field28;
    struct struct_Reg field29;
    unsigned long long field30;
    struct struct_Reg field31;
    unsigned long long field32;
    struct struct_Reg field33;
};
struct struct_anon_3 {
    unsigned long long field0;
    double field1;
};
struct struct_X87Stack {
    struct struct_anon_3 field0[8];
};
struct struct_uint64v1_t {
    unsigned long long field0[1];
};
struct union_vec64_t {
    struct struct_uint64v1_t field0;
};
struct struct_anon_4 {
    unsigned long long field0;
    struct union_vec64_t field1;
};
struct struct_MMX {
    struct struct_anon_4 field0[8];
};
struct struct_FPUStatusFlags {
    unsigned char field0;
    unsigned char field1;
    unsigned char field2;
    unsigned char field3;
    unsigned char field4;
    unsigned char field5;
    unsigned char field6;
    unsigned char field7;
    unsigned char field8;
    unsigned char field9;
    unsigned char field10;
    unsigned char field11;
    unsigned char field12;
    unsigned char field13;
    unsigned char field14;
    unsigned char field15;
    unsigned char field16;
    unsigned char field17;
    unsigned char field18;
    unsigned char field19;
    unsigned char field20[4];
};
struct union_FPUAbridgedTagWord {
    unsigned char field0;
};
struct struct_float80_t {
    unsigned char field0[10];
};
struct union_anon_11 {
    struct struct_float80_t field0;
};
struct struct_FPUStackElem {
    struct union_anon_11 field0;
    unsigned char field1[6];
};
struct struct_uint128v1_t {
    unsigned __int128 field0[1];
};
struct union_vec128_t {
    struct struct_uint128v1_t field0;
};
struct struct_FpuFXSAVE {
    struct union_SegmentSelector field0;
    struct union_SegmentSelector field1;
    struct union_FPUAbridgedTagWord field2;
    unsigned char field3;
    unsigned short field4;
    unsigned int field5;
    struct union_SegmentSelector field6;
    unsigned short field7;
    unsigned int field8;
    struct union_SegmentSelector field9;
    unsigned short field10;
    struct union_anon_1 field11;
    struct union_anon_1 field12;
    struct struct_FPUStackElem field13[8];
    struct union_vec128_t field14[16];
};
struct struct_anon_13 {
    struct struct_FpuFXSAVE field0;
    unsigned char field1[96];
};
struct union_FPU {
    struct struct_anon_13 field0;
};
struct struct_SegmentShadow {
    struct union_anon field0;
    unsigned int field1;
    unsigned int field2;
};
struct struct_SegmentCaches {
    struct struct_SegmentShadow field0;
    struct struct_SegmentShadow field1;
    struct struct_SegmentShadow field2;
    struct struct_SegmentShadow field3;
    struct struct_SegmentShadow field4;
    struct struct_SegmentShadow field5;
};
struct struct_State {
    struct struct_ArchState field0;
    struct union_VectorReg field1[32];
    struct struct_ArithFlags field2;
    struct union_anon field3;
    struct struct_Segments field4;
    struct struct_AddressSpace field5;
    struct struct_GPR field6;
    struct struct_X87Stack field7;
    struct struct_MMX field8;
    struct struct_FPUStatusFlags field9;
    struct union_anon field10;
    struct union_FPU field11;
    struct struct_SegmentCaches field12;
};
struct struct_Memory *__remill_function_return(struct struct_State *arg0, unsigned int arg1, struct struct_Memory *arg2);
unsigned char *rx_brake_routine(unsigned char *arg0, unsigned char *arg1) {
    (arg1[5U]) = ((unsigned char)(((((arg0[4U])) & (unsigned char)12U) == (unsigned char)0U) ^ 1U));
    if ((unsigned char)(int)(unsigned int)((arg0[4U])) >> 2U != (unsigned char)0U) {
        if ((int)(unsigned int)((arg0[3U])) >> 7U | ((arg0[2U])) == (unsigned char)0U && ((arg0[3U])) == (unsigned char)0U ? 1U : 0U != 1U && ((arg1[4U])) == (unsigned char)0U) {
            (arg1[6U]) = (unsigned char)1U;
        }
    } else {
        (arg1[6U]) = (unsigned char)0U;
        (arg1[4U]) = (unsigned char)0U;
    }
    return arg1;
}
