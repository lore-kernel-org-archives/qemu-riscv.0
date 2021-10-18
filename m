Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcP36-0006Bx-0P
	for mharc-qemu-riscv@gnu.org; Mon, 18 Oct 2021 05:35:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mcP2u-0006BK-Ss; Mon, 18 Oct 2021 05:35:05 -0400
Received: from out28-217.mail.aliyun.com ([115.124.28.217]:60750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mcP2p-0005Xd-Qa; Mon, 18 Oct 2021 05:35:04 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436282|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.0244758-6.59035e-05-0.975458;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047206; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=4; RT=4; SR=0; TI=SMTPD_---.LdIDKnk_1634549687; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LdIDKnk_1634549687)
 by smtp.aliyun-inc.com(10.147.41.178);
 Mon, 18 Oct 2021 17:34:48 +0800
Subject: Re: [PATCH v8 00/78] support vector extension v1.0
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
 <c6d6ca26-aa14-8950-2aef-2f92803036c6@c-sky.com>
Message-ID: <3938e703-3000-a11a-a3e6-4a1ffd0e5601@c-sky.com>
Date: Mon, 18 Oct 2021 17:34:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <c6d6ca26-aa14-8950-2aef-2f92803036c6@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.217; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-217.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Oct 2021 09:35:12 -0000

Hi Alistair,

Sorry for the  send error.  And I have a question about this patch set.

Firstly, I totally support the vector v1.0 upstream.

The concern is how to deal with the v0.7.1 code on QEMU. There are some 
products based on the vector v0.7.1,
such as D1 SOC from Allwinner and  Xuantie CPU  from Alibaba. The Linux 
and GCC upstream for D1 is working in progress,
and eventually these projects will support v0.7.1 in some way, probably 
as "x-thead-v" (the "thead" stands for Alibaba T-Head).

Maybe we can

1. Drop the v0.7.1 support permanently.

2. Drop the v0.7.1  temporarily and add  it  back later.

3. Do some compatible work for v0.7.1 in the v1.0 patch set.

Look forward to your idea. Thanks very much.

Best Regards,
Zhiwei

On 2021/10/18 下午5:01, LIU Zhiwei wrote:
> Hi Alistair,
>
> There is some products based on the vector v0.7.1, such as D1 SOC from 
> Allwinner and  Xuantie CPU  And we have spent a lot of work to 
> support  vector  on QEMU.
>
>
>
> Allwinner
>
>
> On 2021/10/15 下午3:45, frank.chang@sifive.com wrote:
>> From: Frank Chang <frank.chang@sifive.com>
>>
>> This patchset implements the vector extension v1.0 for RISC-V on QEMU.
>>
>> RVV v1.0 spec is now fronzen for public review:
>> https://github.com/riscv/riscv-v-spec/releases/tag/v1.0
>>
>> The port is available here:
>> https://github.com/sifive/qemu/tree/rvv-1.0-upstream-v8
>>
>> RVV v1.0 can be enabled with -cpu option: v=true and specify vext_spec
>> option to v1.0 (i.e. vext_spec=v1.0)
>>
>> Note: This patchset depends on other patchsets listed in Based-on
>>        section below so it is not able to be built unless those 
>> patchsets
>>        are applied.
>>
>> Changelog:
>>
>> v8
>>    * Use {get,dest}_gpr APIs.
>>    * remove vector AMO instructions.
>>    * rename vpopc.m to vcpop.m.
>>    * rename vle1.v and vse1.v to vlm.v and vsm.v.
>>    * rename vmandnot.mm and vmornot.mm to vmandn.mm and vmorn.mm.
>>
>> v7
>>    * remove hardcoded GDB vector registers list.
>>    * add vsetivli instruction.
>>    * add vle1.v and vse1.v instructions.
>>
>> v6
>>    * add vector floating-point reciprocal estimate instruction.
>>    * add vector floating-point reciprocal square-root estimate 
>> instruction.
>>    * update check rules for segment register groups, each segment 
>> register
>>      group has to follow overlap rules.
>>    * update viota.m instruction check rules.
>>
>> v5
>>    * refactor RVV v1.0 check functions.
>>      (Thanks to Richard Henderson's bitwise tricks.)
>>    * relax RV_VLEN_MAX to 1024-bits.
>>    * implement vstart CSR's behaviors.
>>    * trigger illegal instruction exception if frm is not valid for
>>      vector floating-point instructions.
>>    * rebase on riscv-to-apply.next.
>>
>> v4
>>    * remove explicit float flmul variable in DisasContext.
>>    * replace floating-point calculations with shift operations to
>>      improve performance.
>>    * relax RV_VLEN_MAX to 512-bits.
>>
>> v3
>>    * apply nan-box helpers from Richard Henderson.
>>    * remove fp16 api changes as they are sent independently in another
>>      pathcset by Chih-Min Chao.
>>    * remove all tail elements clear functions as tail elements can
>>      retain unchanged for either VTA set to undisturbed or agnostic.
>>    * add fp16 nan-box check generator function.
>>    * add floating-point rounding mode enum.
>>    * replace flmul arithmetic with shifts to avoid floating-point
>>      conversions.
>>    * add Zvqmac extension.
>>    * replace gdbstub vector register xml files with dynamic generator.
>>    * bumped to RVV v1.0.
>>    * RVV v1.0 related changes:
>>      * add vl<nf>re<eew>.v and vs<nf>r.v vector whole register
>>        load/store instructions
>>      * add vrgatherei16 instruction.
>>      * rearranged bits in vtype to make vlmul bits into a contiguous
>>        field.
>>
>> v2
>>    * drop v0.7.1 support.
>>    * replace invisible return check macros with functions.
>>    * move mark_vs_dirty() to translators.
>>    * add SSTATUS_VS flag for s-mode.
>>    * nan-box scalar fp register for floating-point operations.
>>    * add gdbstub files for vector registers to allow system-mode
>>      debugging with GDB.
>>
>> Based-on: <20211015065500.3850513-1-frank.chang@sifive.com>
>> Based-on: <20211015070307.3860984-1-frank.chang@sifive.com>
>>
>> Frank Chang (73):
>>    target/riscv: fix TB_FLAGS bits overlapping bug for rvv/rvh
>>    target/riscv: drop vector 0.7.1 and add 1.0 support
>>    target/riscv: Use FIELD_EX32() to extract wd field
>>    target/riscv: rvv-1.0: introduce writable misa.v field
>>    target/riscv: rvv-1.0: add translation-time vector context status
>>    target/riscv: rvv-1.0: remove rvv related codes from fcsr registers
>>    target/riscv: rvv-1.0: check MSTATUS_VS when accessing vector csr
>>      registers
>>    target/riscv: rvv-1.0: remove MLEN calculations
>>    target/riscv: rvv-1.0: add fractional LMUL
>>    target/riscv: rvv-1.0: add VMA and VTA
>>    target/riscv: rvv-1.0: update check functions
>>    target/riscv: introduce more imm value modes in translator functions
>>    target/riscv: rvv:1.0: add translation-time nan-box helper function
>>    target/riscv: rvv-1.0: remove amo operations instructions
>>    target/riscv: rvv-1.0: configure instructions
>>    target/riscv: rvv-1.0: stride load and store instructions
>>    target/riscv: rvv-1.0: index load and store instructions
>>    target/riscv: rvv-1.0: fix address index overflow bug of indexed
>>      load/store insns
>>    target/riscv: rvv-1.0: fault-only-first unit stride load
>>    target/riscv: rvv-1.0: load/store whole register instructions
>>    target/riscv: rvv-1.0: update vext_max_elems() for load/store insns
>>    target/riscv: rvv-1.0: take fractional LMUL into vector max elements
>>      calculation
>>    target/riscv: rvv-1.0: floating-point square-root instruction
>>    target/riscv: rvv-1.0: floating-point classify instructions
>>    target/riscv: rvv-1.0: count population in mask instruction
>>    target/riscv: rvv-1.0: find-first-set mask bit instruction
>>    target/riscv: rvv-1.0: set-X-first mask bit instructions
>>    target/riscv: rvv-1.0: iota instruction
>>    target/riscv: rvv-1.0: element index instruction
>>    target/riscv: rvv-1.0: allow load element with sign-extended
>>    target/riscv: rvv-1.0: register gather instructions
>>    target/riscv: rvv-1.0: integer scalar move instructions
>>    target/riscv: rvv-1.0: floating-point move instruction
>>    target/riscv: rvv-1.0: floating-point scalar move instructions
>>    target/riscv: rvv-1.0: whole register move instructions
>>    target/riscv: rvv-1.0: integer extension instructions
>>    target/riscv: rvv-1.0: single-width averaging add and subtract
>>      instructions
>>    target/riscv: rvv-1.0: single-width bit shift instructions
>>    target/riscv: rvv-1.0: integer add-with-carry/subtract-with-borrow
>>    target/riscv: rvv-1.0: narrowing integer right shift instructions
>>    target/riscv: rvv-1.0: widening integer multiply-add instructions
>>    target/riscv: rvv-1.0: single-width saturating add and subtract
>>      instructions
>>    target/riscv: rvv-1.0: integer comparison instructions
>>    target/riscv: rvv-1.0: floating-point compare instructions
>>    target/riscv: rvv-1.0: mask-register logical instructions
>>    target/riscv: rvv-1.0: slide instructions
>>    target/riscv: rvv-1.0: floating-point slide instructions
>>    target/riscv: rvv-1.0: narrowing fixed-point clip instructions
>>    target/riscv: rvv-1.0: single-width floating-point reduction
>>    target/riscv: rvv-1.0: widening floating-point reduction instructions
>>    target/riscv: rvv-1.0: single-width scaling shift instructions
>>    target/riscv: rvv-1.0: remove widening saturating scaled multiply-add
>>    target/riscv: rvv-1.0: remove vmford.vv and vmford.vf
>>    target/riscv: rvv-1.0: remove integer extract instruction
>>    target/riscv: rvv-1.0: floating-point min/max instructions
>>    target/riscv: introduce floating-point rounding mode enum
>>    target/riscv: rvv-1.0: floating-point/integer type-convert
>>      instructions
>>    target/riscv: rvv-1.0: widening floating-point/integer type-convert
>>    target/riscv: add "set round to odd" rounding mode helper function
>>    target/riscv: rvv-1.0: narrowing floating-point/integer type-convert
>>    target/riscv: rvv-1.0: relax RV_VLEN_MAX to 1024-bits
>>    target/riscv: rvv-1.0: implement vstart CSR
>>    target/riscv: rvv-1.0: trigger illegal instruction exception if 
>> frm is
>>      not valid
>>    target/riscv: rvv-1.0: set mstatus.SD bit when writing vector CSRs
>>    target/riscv: rvv-1.0: floating-point reciprocal square-root estimate
>>      instruction
>>    target/riscv: rvv-1.0: floating-point reciprocal estimate instruction
>>    target/riscv: set mstatus.SD bit when writing fp CSRs
>>    target/riscv: rvv-1.0: rename r2_zimm to r2_zimm11
>>    target/riscv: rvv-1.0: add vsetivli instruction
>>    target/riscv: rvv-1.0: add evl parameter to vext_ldst_us()
>>    target/riscv: rvv-1.0: add vector unit-stride mask load/store insns
>>    target/riscv: rvv-1.0: rename vmandnot.mm and vmornot.mm to vmandn.mm
>>      and vmorn.mm
>>    target/riscv: rvv-1.0: update opivv_vadc_check() comment
>>
>> Greentime Hu (1):
>>    target/riscv: rvv-1.0: add vlenb register
>>
>> Hsiangkai Wang (1):
>>    target/riscv: gdb: support vector registers for rv64 & rv32
>>
>> LIU Zhiwei (3):
>>    target/riscv: rvv-1.0: add mstatus VS field
>>    target/riscv: rvv-1.0: add sstatus VS field
>>    target/riscv: rvv-1.0: add vcsr register
>>
>>   target/riscv/cpu.c                      |   12 +-
>>   target/riscv/cpu.h                      |   85 +-
>>   target/riscv/cpu_bits.h                 |   10 +
>>   target/riscv/cpu_helper.c               |   15 +-
>>   target/riscv/csr.c                      |   92 +-
>>   target/riscv/fpu_helper.c               |   17 +-
>>   target/riscv/gdbstub.c                  |  184 ++
>>   target/riscv/helper.h                   |  435 ++-
>>   target/riscv/insn32.decode              |  294 +-
>>   target/riscv/insn_trans/trans_rvv.c.inc | 2423 +++++++++------
>>   target/riscv/internals.h                |   24 +-
>>   target/riscv/translate.c                |   74 +-
>>   target/riscv/vector_helper.c            | 3601 ++++++++++++-----------
>>   13 files changed, 4176 insertions(+), 3090 deletions(-)
>>
>> -- 
>> 2.25.1
>>
>>

