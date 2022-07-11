Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oAsjd-0005rF-6G
	for mharc-qemu-riscv@gnu.org; Mon, 11 Jul 2022 08:41:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oAsja-0005qr-Ng; Mon, 11 Jul 2022 08:41:54 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:39938 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oAsjV-0001AM-TQ; Mon, 11 Jul 2022 08:41:54 -0400
Received: from [192.168.3.6] (unknown [180.156.173.38])
 by APP-01 (Coremail) with SMTP id qwCowACHVFl_GsxiNOugDg--.56847S2;
 Mon, 11 Jul 2022 20:41:37 +0800 (CST)
Subject: Re: [PATCH 3/6] target/riscv: fix checkpatch warning may triggered in
 csr_ops table
To: Alistair Francis <alistair23@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?=
 <lazyparser@gmail.com>
References: <20220710082400.29224-1-liweiwei@iscas.ac.cn>
 <20220710082400.29224-4-liweiwei@iscas.ac.cn>
 <CAKmqyKPoRCGkM7VD83Rf-yr7s-bDCWAcuy8yet8k6KmScAtXwQ@mail.gmail.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <7530bb30-019a-9b50-54f6-9db014195533@iscas.ac.cn>
Date: Mon, 11 Jul 2022 20:41:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKPoRCGkM7VD83Rf-yr7s-bDCWAcuy8yet8k6KmScAtXwQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: qwCowACHVFl_GsxiNOugDg--.56847S2
X-Coremail-Antispam: 1UD129KBjvAXoWfur18tFW5XF4UGr48XFyxXwb_yoW5Ww1xuo
 W5Ja15Arn7Gr1YgF1jvFs7XFs8uF15A3Z3Za1fWF1DK3W0grW0grZ8WFWUXF4rGF40gFy0
 gw1jy39rKr4xWw13n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjp_UUUY67AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20EY4v20xva
 j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
 x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8
 JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
 IcxG8wCY1x0264kExVAvwVAq07x20xyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
 v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
 1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
 AIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0D
 MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvf
 C2KfnxnUUI43ZEXa7VUj0JPtUUUUU==
X-Originating-IP: [180.156.173.38]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Jul 2022 12:41:55 -0000


在 2022/7/11 下午2:41, Alistair Francis 写道:
> On Sun, Jul 10, 2022 at 6:28 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>> - line over 80 characters will trigger warning when running checkpatch
>>
>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>> ---
>>   target/riscv/csr.c | 362 ++++++++++++++++++++++++---------------------
>>   1 file changed, 196 insertions(+), 166 deletions(-)
>>
>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>> index 235f2a011e..9bda1ff993 100644
>> --- a/target/riscv/csr.c
>> +++ b/target/riscv/csr.c
>> @@ -3462,19 +3462,19 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>>       [CSR_FCSR]     = { "fcsr",     fs,     read_fcsr,    write_fcsr   },
>>       /* Vector CSRs */
>>       [CSR_VSTART]   = { "vstart",   vs,    read_vstart,  write_vstart,
>> -                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
>> +                                    .min_priv_ver = PRIV_VERSION_1_12_0 },
> Thanks for this!
>
> I think while we are changing these we should have all of the newlines
> start at the same position. So the .min_priv_ver should line up with
> "vstart" in this case
>
> Alistair

OK. I'll do this later.

Regards,

Weiwei Li

>>       [CSR_VXSAT]    = { "vxsat",    vs,    read_vxsat,   write_vxsat,
>> -                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
>> +                                    .min_priv_ver = PRIV_VERSION_1_12_0 },
>>       [CSR_VXRM]     = { "vxrm",     vs,    read_vxrm,    write_vxrm,
>> -                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
>> +                                    .min_priv_ver = PRIV_VERSION_1_12_0 },
>>       [CSR_VCSR]     = { "vcsr",     vs,    read_vcsr,    write_vcsr,
>> -                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
>> +                                    .min_priv_ver = PRIV_VERSION_1_12_0 },
>>       [CSR_VL]       = { "vl",       vs,    read_vl,
>> -                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
>> +                                    .min_priv_ver = PRIV_VERSION_1_12_0 },
>>       [CSR_VTYPE]    = { "vtype",    vs,    read_vtype,
>> -                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
>> +                                    .min_priv_ver = PRIV_VERSION_1_12_0 },
>>       [CSR_VLENB]    = { "vlenb",    vs,    read_vlenb,
>> -                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
>> +                                    .min_priv_ver = PRIV_VERSION_1_12_0 },
>>       /* User Timers and Counters */
>>       [CSR_CYCLE]    = { "cycle",    ctr,    read_hpmcounter  },
>>       [CSR_INSTRET]  = { "instret",  ctr,    read_hpmcounter  },
>> @@ -3493,10 +3493,14 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>>
>>   #if !defined(CONFIG_USER_ONLY)
>>       /* Machine Timers and Counters */
>> -    [CSR_MCYCLE]    = { "mcycle",    any,   read_hpmcounter, write_mhpmcounter},
>> -    [CSR_MINSTRET]  = { "minstret",  any,   read_hpmcounter, write_mhpmcounter},
>> -    [CSR_MCYCLEH]   = { "mcycleh",   any32, read_hpmcounterh, write_mhpmcounterh},
>> -    [CSR_MINSTRETH] = { "minstreth", any32, read_hpmcounterh, write_mhpmcounterh},
>> +    [CSR_MCYCLE]    = { "mcycle",    any,   read_hpmcounter,
>> +                                            write_mhpmcounter  },
>> +    [CSR_MINSTRET]  = { "minstret",  any,   read_hpmcounter,
>> +                                            write_mhpmcounter  },
>> +    [CSR_MCYCLEH]   = { "mcycleh",   any32, read_hpmcounterh,
>> +                                            write_mhpmcounterh },
>> +    [CSR_MINSTRETH] = { "minstreth", any32, read_hpmcounterh,
>> +                                            write_mhpmcounterh },
>>
>>       /* Machine Information Registers */
>>       [CSR_MVENDORID] = { "mvendorid", any,   read_mvendorid },
>> @@ -3507,29 +3511,32 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>>       [CSR_MCONFIGPTR]  = { "mconfigptr", any,   read_zero,
>>                                           .min_priv_ver = PRIV_VERSION_1_12_0 },
>>       /* Machine Trap Setup */
>> -    [CSR_MSTATUS]     = { "mstatus",    any,   read_mstatus,     write_mstatus, NULL,
>> -                                               read_mstatus_i128                   },
>> -    [CSR_MISA]        = { "misa",       any,   read_misa,        write_misa, NULL,
>> -                                               read_misa_i128                      },
>> -    [CSR_MIDELEG]     = { "mideleg",    any,   NULL,    NULL,    rmw_mideleg       },
>> -    [CSR_MEDELEG]     = { "medeleg",    any,   read_medeleg,     write_medeleg     },
>> -    [CSR_MIE]         = { "mie",        any,   NULL,    NULL,    rmw_mie           },
>> -    [CSR_MTVEC]       = { "mtvec",      any,   read_mtvec,       write_mtvec       },
>> -    [CSR_MCOUNTEREN]  = { "mcounteren", any,   read_mcounteren,  write_mcounteren  },
>> -
>> -    [CSR_MSTATUSH]    = { "mstatush",   any32, read_mstatush,    write_mstatush    },
>> +    [CSR_MSTATUS]     = { "mstatus",    any,   read_mstatus,
>> +                                               write_mstatus, NULL,
>> +                                               read_mstatus_i128            },
>> +    [CSR_MISA]        = { "misa",       any,   read_misa,
>> +                                               write_misa, NULL,
>> +                                               read_misa_i128               },
>> +    [CSR_MIDELEG]     = { "mideleg",    any,   NULL,  NULL,   rmw_mideleg   },
>> +    [CSR_MEDELEG]     = { "medeleg",    any,   read_medeleg,  write_medeleg },
>> +    [CSR_MIE]         = { "mie",        any,   NULL,  NULL,   rmw_mie       },
>> +    [CSR_MTVEC]       = { "mtvec",      any,   read_mtvec,    write_mtvec   },
>> +    [CSR_MCOUNTEREN]  = { "mcounteren", any,   read_mcounteren,
>> +                                               write_mcounteren             },
>> +
>> +    [CSR_MSTATUSH]    = { "mstatush", any32, read_mstatush, write_mstatush  },
>>
>>       /* Machine Trap Handling */
>> -    [CSR_MSCRATCH] = { "mscratch", any,  read_mscratch,      write_mscratch, NULL,
>> -                                         read_mscratch_i128, write_mscratch_i128   },
>> +    [CSR_MSCRATCH] = { "mscratch", any,  read_mscratch, write_mscratch,
>> +                         NULL, read_mscratch_i128, write_mscratch_i128 },
>>       [CSR_MEPC]     = { "mepc",     any,  read_mepc,     write_mepc     },
>>       [CSR_MCAUSE]   = { "mcause",   any,  read_mcause,   write_mcause   },
>>       [CSR_MTVAL]    = { "mtval",    any,  read_mtval,    write_mtval    },
>>       [CSR_MIP]      = { "mip",      any,  NULL,    NULL, rmw_mip        },
>>
>>       /* Machine-Level Window to Indirectly Accessed Registers (AIA) */
>> -    [CSR_MISELECT] = { "miselect", aia_any,   NULL, NULL,    rmw_xiselect },
>> -    [CSR_MIREG]    = { "mireg",    aia_any,   NULL, NULL,    rmw_xireg },
>> +    [CSR_MISELECT] = { "miselect", aia_any,   NULL, NULL, rmw_xiselect },
>> +    [CSR_MIREG]    = { "mireg",    aia_any,   NULL, NULL, rmw_xireg    },
>>
>>       /* Machine-Level Interrupts (AIA) */
>>       [CSR_MTOPEI]     = { "mtopei",     aia_any, NULL, NULL, rmw_xtopei },
>> @@ -3548,26 +3555,27 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>>
>>       /* Execution environment configuration */
>>       [CSR_MENVCFG]  = { "menvcfg",  any,   read_menvcfg,  write_menvcfg,
>> -                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
>> +                                    .min_priv_ver = PRIV_VERSION_1_12_0 },
>>       [CSR_MENVCFGH] = { "menvcfgh", any32, read_menvcfgh, write_menvcfgh,
>> -                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
>> +                                    .min_priv_ver = PRIV_VERSION_1_12_0 },
>>       [CSR_SENVCFG]  = { "senvcfg",  smode, read_senvcfg,  write_senvcfg,
>> -                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
>> +                                    .min_priv_ver = PRIV_VERSION_1_12_0 },
>>       [CSR_HENVCFG]  = { "henvcfg",  hmode, read_henvcfg, write_henvcfg,
>> -                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
>> +                                    .min_priv_ver = PRIV_VERSION_1_12_0 },
>>       [CSR_HENVCFGH] = { "henvcfgh", hmode32, read_henvcfgh, write_henvcfgh,
>> -                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
>> +                                    .min_priv_ver = PRIV_VERSION_1_12_0 },
>>
>>       /* Supervisor Trap Setup */
>> -    [CSR_SSTATUS]    = { "sstatus",    smode, read_sstatus,    write_sstatus, NULL,
>> -                                              read_sstatus_i128                 },
>> -    [CSR_SIE]        = { "sie",        smode, NULL,   NULL,    rmw_sie          },
>> -    [CSR_STVEC]      = { "stvec",      smode, read_stvec,      write_stvec      },
>> -    [CSR_SCOUNTEREN] = { "scounteren", smode, read_scounteren, write_scounteren },
>> +    [CSR_SSTATUS]    = { "sstatus",    smode, read_sstatus,  write_sstatus,
>> +                                       NULL,  read_sstatus_i128          },
>> +    [CSR_SIE]        = { "sie",        smode, NULL,   NULL,  rmw_sie     },
>> +    [CSR_STVEC]      = { "stvec",      smode, read_stvec,    write_stvec },
>> +    [CSR_SCOUNTEREN] = { "scounteren", smode, read_scounteren,
>> +                                              write_scounteren           },
>>
>>       /* Supervisor Trap Handling */
>> -    [CSR_SSCRATCH] = { "sscratch", smode, read_sscratch, write_sscratch, NULL,
>> -                                          read_sscratch_i128, write_sscratch_i128  },
>> +    [CSR_SSCRATCH] = { "sscratch", smode, read_sscratch, write_sscratch,
>> +                        NULL,      read_sscratch_i128, write_sscratch_i128 },
>>       [CSR_SEPC]     = { "sepc",     smode, read_sepc,     write_sepc     },
>>       [CSR_SCAUSE]   = { "scause",   smode, read_scause,   write_scause   },
>>       [CSR_STVAL]    = { "stval",    smode, read_stval,   write_stval   },
>> @@ -3588,81 +3596,94 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>>       [CSR_SIEH]       = { "sieh",   aia_smode32, NULL, NULL, rmw_sieh },
>>       [CSR_SIPH]       = { "siph",   aia_smode32, NULL, NULL, rmw_siph },
>>
>> -    [CSR_HSTATUS]     = { "hstatus",     hmode,   read_hstatus,   write_hstatus,
>> -                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>> -    [CSR_HEDELEG]     = { "hedeleg",     hmode,   read_hedeleg,   write_hedeleg,
>> -                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>> +    [CSR_HSTATUS]     = { "hstatus",     hmode,   read_hstatus, write_hstatus,
>> +                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
>> +    [CSR_HEDELEG]     = { "hedeleg",     hmode,   read_hedeleg, write_hedeleg,
>> +                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
>>       [CSR_HIDELEG]     = { "hideleg",     hmode,   NULL,   NULL, rmw_hideleg,
>> -                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>> -    [CSR_HVIP]        = { "hvip",        hmode,   NULL,   NULL,   rmw_hvip,
>> -                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>> -    [CSR_HIP]         = { "hip",         hmode,   NULL,   NULL,   rmw_hip,
>> -                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>> -    [CSR_HIE]         = { "hie",         hmode,   NULL,   NULL,    rmw_hie,
>> -                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>> -    [CSR_HCOUNTEREN]  = { "hcounteren",  hmode,   read_hcounteren, write_hcounteren,
>> -                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>> -    [CSR_HGEIE]       = { "hgeie",       hmode,   read_hgeie,       write_hgeie,
>> -                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>> -    [CSR_HTVAL]       = { "htval",       hmode,   read_htval,     write_htval,
>> -                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>> -    [CSR_HTINST]      = { "htinst",      hmode,   read_htinst,    write_htinst,
>> -                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>> +                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
>> +    [CSR_HVIP]        = { "hvip",        hmode,   NULL,   NULL, rmw_hvip,
>> +                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
>> +    [CSR_HIP]         = { "hip",         hmode,   NULL,   NULL, rmw_hip,
>> +                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
>> +    [CSR_HIE]         = { "hie",         hmode,   NULL,   NULL, rmw_hie,
>> +                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
>> +    [CSR_HCOUNTEREN]  = { "hcounteren",  hmode,   read_hcounteren,
>> +                                         write_hcounteren,
>> +                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
>> +    [CSR_HGEIE]       = { "hgeie",       hmode,   read_hgeie,   write_hgeie,
>> +                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
>> +    [CSR_HTVAL]       = { "htval",       hmode,   read_htval,   write_htval,
>> +                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
>> +    [CSR_HTINST]      = { "htinst",      hmode,   read_htinst,  write_htinst,
>> +                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
>>       [CSR_HGEIP]       = { "hgeip",       hmode,   read_hgeip,
>> -                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>> -    [CSR_HGATP]       = { "hgatp",       hmode,   read_hgatp,     write_hgatp,
>> -                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>> -    [CSR_HTIMEDELTA]  = { "htimedelta",  hmode,   read_htimedelta, write_htimedelta,
>> -                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>> -    [CSR_HTIMEDELTAH] = { "htimedeltah", hmode32, read_htimedeltah, write_htimedeltah,
>> -                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>> -
>> -    [CSR_VSSTATUS]    = { "vsstatus",    hmode,   read_vsstatus,  write_vsstatus,
>> -                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>> -    [CSR_VSIP]        = { "vsip",        hmode,   NULL,    NULL,  rmw_vsip,
>> -                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>> -    [CSR_VSIE]        = { "vsie",        hmode,   NULL,    NULL,    rmw_vsie ,
>> -                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>> -    [CSR_VSTVEC]      = { "vstvec",      hmode,   read_vstvec,    write_vstvec,
>> -                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>> -    [CSR_VSSCRATCH]   = { "vsscratch",   hmode,   read_vsscratch, write_vsscratch,
>> -                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>> -    [CSR_VSEPC]       = { "vsepc",       hmode,   read_vsepc,     write_vsepc,
>> -                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>> -    [CSR_VSCAUSE]     = { "vscause",     hmode,   read_vscause,   write_vscause,
>> -                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>> -    [CSR_VSTVAL]      = { "vstval",      hmode,   read_vstval,    write_vstval,
>> -                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>> -    [CSR_VSATP]       = { "vsatp",       hmode,   read_vsatp,     write_vsatp,
>> -                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>> -
>> -    [CSR_MTVAL2]      = { "mtval2",      hmode,   read_mtval2,    write_mtval2,
>> -                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>> -    [CSR_MTINST]      = { "mtinst",      hmode,   read_mtinst,    write_mtinst,
>> -                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>> +                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
>> +    [CSR_HGATP]       = { "hgatp",       hmode,   read_hgatp,   write_hgatp,
>> +                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
>> +    [CSR_HTIMEDELTA]  = { "htimedelta",  hmode,   read_htimedelta,
>> +                                         write_htimedelta,
>> +                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
>> +    [CSR_HTIMEDELTAH] = { "htimedeltah", hmode32, read_htimedeltah,
>> +                                         write_htimedeltah,
>> +                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
>> +
>> +    [CSR_VSSTATUS]    = { "vsstatus",    hmode,   read_vsstatus,
>> +                                         write_vsstatus,
>> +                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
>> +    [CSR_VSIP]        = { "vsip",        hmode,   NULL,   NULL, rmw_vsip,
>> +                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
>> +    [CSR_VSIE]        = { "vsie",        hmode,   NULL,   NULL, rmw_vsie,
>> +                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
>> +    [CSR_VSTVEC]      = { "vstvec",      hmode,   read_vstvec,  write_vstvec,
>> +                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
>> +    [CSR_VSSCRATCH]   = { "vsscratch",   hmode,   read_vsscratch,
>> +                                         write_vsscratch,
>> +                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
>> +    [CSR_VSEPC]       = { "vsepc",       hmode,   read_vsepc,   write_vsepc,
>> +                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
>> +    [CSR_VSCAUSE]     = { "vscause",     hmode,   read_vscause, write_vscause,
>> +                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
>> +    [CSR_VSTVAL]      = { "vstval",      hmode,   read_vstval,  write_vstval,
>> +                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
>> +    [CSR_VSATP]       = { "vsatp",       hmode,   read_vsatp,   write_vsatp,
>> +                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
>> +
>> +    [CSR_MTVAL2]      = { "mtval2",      hmode,   read_mtval2,  write_mtval2,
>> +                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
>> +    [CSR_MTINST]      = { "mtinst",      hmode,   read_mtinst,  write_mtinst,
>> +                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
>>
>>       /* Virtual Interrupts and Interrupt Priorities (H-extension with AIA) */
>>       [CSR_HVIEN]       = { "hvien",       aia_hmode, read_zero, write_ignore },
>> -    [CSR_HVICTL]      = { "hvictl",      aia_hmode, read_hvictl, write_hvictl },
>> -    [CSR_HVIPRIO1]    = { "hviprio1",    aia_hmode, read_hviprio1,   write_hviprio1 },
>> -    [CSR_HVIPRIO2]    = { "hviprio2",    aia_hmode, read_hviprio2,   write_hviprio2 },
>> +    [CSR_HVICTL]      = { "hvictl",      aia_hmode, read_hvictl,
>> +                                                    write_hvictl            },
>> +    [CSR_HVIPRIO1]    = { "hviprio1",    aia_hmode, read_hviprio1,
>> +                                                    write_hviprio1          },
>> +    [CSR_HVIPRIO2]    = { "hviprio2",    aia_hmode, read_hviprio2,
>> +                                                    write_hviprio2          },
>>
>>       /*
>>        * VS-Level Window to Indirectly Accessed Registers (H-extension with AIA)
>>        */
>> -    [CSR_VSISELECT]   = { "vsiselect",   aia_hmode, NULL, NULL,      rmw_xiselect },
>> -    [CSR_VSIREG]      = { "vsireg",      aia_hmode, NULL, NULL,      rmw_xireg },
>> +    [CSR_VSISELECT]   = { "vsiselect",   aia_hmode, NULL, NULL,
>> +                                                    rmw_xiselect            },
>> +    [CSR_VSIREG]      = { "vsireg",      aia_hmode, NULL, NULL,  rmw_xireg  },
>>
>>       /* VS-Level Interrupts (H-extension with AIA) */
>> -    [CSR_VSTOPEI]     = { "vstopei",     aia_hmode, NULL, NULL, rmw_xtopei },
>> +    [CSR_VSTOPEI]     = { "vstopei",     aia_hmode, NULL, NULL,  rmw_xtopei },
>>       [CSR_VSTOPI]      = { "vstopi",      aia_hmode, read_vstopi },
>>
>>       /* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) */
>> -    [CSR_HIDELEGH]    = { "hidelegh",    aia_hmode32, NULL, NULL, rmw_hidelegh },
>> -    [CSR_HVIENH]      = { "hvienh",      aia_hmode32, read_zero, write_ignore },
>> +    [CSR_HIDELEGH]    = { "hidelegh",    aia_hmode32, NULL, NULL,
>> +                                                      rmw_hidelegh          },
>> +    [CSR_HVIENH]      = { "hvienh",      aia_hmode32, read_zero,
>> +                                                      write_ignore          },
>>       [CSR_HVIPH]       = { "hviph",       aia_hmode32, NULL, NULL, rmw_hviph },
>> -    [CSR_HVIPRIO1H]   = { "hviprio1h",   aia_hmode32, read_hviprio1h, write_hviprio1h },
>> -    [CSR_HVIPRIO2H]   = { "hviprio2h",   aia_hmode32, read_hviprio2h, write_hviprio2h },
>> +    [CSR_HVIPRIO1H]   = { "hviprio1h",   aia_hmode32, read_hviprio1h,
>> +                                                      write_hviprio1h       },
>> +    [CSR_HVIPRIO2H]   = { "hviprio2h",   aia_hmode32, read_hviprio2h,
>> +                                                      write_hviprio2h       },
>>       [CSR_VSIEH]       = { "vsieh",       aia_hmode32, NULL, NULL, rmw_vsieh },
>>       [CSR_VSIPH]       = { "vsiph",       aia_hmode32, NULL, NULL, rmw_vsiph },
>>
>> @@ -3697,17 +3718,26 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>>       [CSR_TDATA3]    =  { "tdata3",  debug, read_tdata,   write_tdata   },
>>
>>       /* User Pointer Masking */
>> -    [CSR_UMTE]    =    { "umte",    pointer_masking, read_umte,    write_umte    },
>> -    [CSR_UPMMASK] =    { "upmmask", pointer_masking, read_upmmask, write_upmmask },
>> -    [CSR_UPMBASE] =    { "upmbase", pointer_masking, read_upmbase, write_upmbase },
>> +    [CSR_UMTE]    =    { "umte",    pointer_masking, read_umte,
>> +                                                     write_umte    },
>> +    [CSR_UPMMASK] =    { "upmmask", pointer_masking, read_upmmask,
>> +                                                     write_upmmask },
>> +    [CSR_UPMBASE] =    { "upmbase", pointer_masking, read_upmbase,
>> +                                                     write_upmbase },
>>       /* Machine Pointer Masking */
>> -    [CSR_MMTE]    =    { "mmte",    pointer_masking, read_mmte,    write_mmte    },
>> -    [CSR_MPMMASK] =    { "mpmmask", pointer_masking, read_mpmmask, write_mpmmask },
>> -    [CSR_MPMBASE] =    { "mpmbase", pointer_masking, read_mpmbase, write_mpmbase },
>> +    [CSR_MMTE]    =    { "mmte",    pointer_masking, read_mmte,
>> +                                                     write_mmte    },
>> +    [CSR_MPMMASK] =    { "mpmmask", pointer_masking, read_mpmmask,
>> +                                                     write_mpmmask },
>> +    [CSR_MPMBASE] =    { "mpmbase", pointer_masking, read_mpmbase,
>> +                                                     write_mpmbase },
>>       /* Supervisor Pointer Masking */
>> -    [CSR_SMTE]    =    { "smte",    pointer_masking, read_smte,    write_smte    },
>> -    [CSR_SPMMASK] =    { "spmmask", pointer_masking, read_spmmask, write_spmmask },
>> -    [CSR_SPMBASE] =    { "spmbase", pointer_masking, read_spmbase, write_spmbase },
>> +    [CSR_SMTE]    =    { "smte",    pointer_masking, read_smte,
>> +                                                     write_smte    },
>> +    [CSR_SPMMASK] =    { "spmmask", pointer_masking, read_spmmask,
>> +                                                     write_spmmask },
>> +    [CSR_SPMBASE] =    { "spmbase", pointer_masking, read_spmbase,
>> +                                                     write_spmbase },
>>
>>       /* Performance Counters */
>>       [CSR_HPMCOUNTER3]    = { "hpmcounter3",    ctr,    read_hpmcounter },
>> @@ -3740,66 +3770,66 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>>       [CSR_HPMCOUNTER30]   = { "hpmcounter30",   ctr,    read_hpmcounter },
>>       [CSR_HPMCOUNTER31]   = { "hpmcounter31",   ctr,    read_hpmcounter },
>>
>> -    [CSR_MHPMCOUNTER3]   = { "mhpmcounter3",   mctr,    read_hpmcounter,
>> +    [CSR_MHPMCOUNTER3]   = { "mhpmcounter3",   mctr,   read_hpmcounter,
>>                                                          write_mhpmcounter },
>> -    [CSR_MHPMCOUNTER4]   = { "mhpmcounter4",   mctr,    read_hpmcounter,
>> +    [CSR_MHPMCOUNTER4]   = { "mhpmcounter4",   mctr,   read_hpmcounter,
>>                                                          write_mhpmcounter },
>> -    [CSR_MHPMCOUNTER5]   = { "mhpmcounter5",   mctr,    read_hpmcounter,
>> +    [CSR_MHPMCOUNTER5]   = { "mhpmcounter5",   mctr,   read_hpmcounter,
>>                                                          write_mhpmcounter },
>> -    [CSR_MHPMCOUNTER6]   = { "mhpmcounter6",   mctr,    read_hpmcounter,
>> +    [CSR_MHPMCOUNTER6]   = { "mhpmcounter6",   mctr,   read_hpmcounter,
>>                                                          write_mhpmcounter },
>> -    [CSR_MHPMCOUNTER7]   = { "mhpmcounter7",   mctr,    read_hpmcounter,
>> +    [CSR_MHPMCOUNTER7]   = { "mhpmcounter7",   mctr,   read_hpmcounter,
>>                                                          write_mhpmcounter },
>> -    [CSR_MHPMCOUNTER8]   = { "mhpmcounter8",   mctr,    read_hpmcounter,
>> +    [CSR_MHPMCOUNTER8]   = { "mhpmcounter8",   mctr,   read_hpmcounter,
>>                                                          write_mhpmcounter },
>> -    [CSR_MHPMCOUNTER9]   = { "mhpmcounter9",   mctr,    read_hpmcounter,
>> +    [CSR_MHPMCOUNTER9]   = { "mhpmcounter9",   mctr,   read_hpmcounter,
>>                                                          write_mhpmcounter },
>> -    [CSR_MHPMCOUNTER10]  = { "mhpmcounter10",  mctr,    read_hpmcounter,
>> +    [CSR_MHPMCOUNTER10]  = { "mhpmcounter10",  mctr,   read_hpmcounter,
>>                                                          write_mhpmcounter },
>> -    [CSR_MHPMCOUNTER11]  = { "mhpmcounter11",  mctr,    read_hpmcounter,
>> +    [CSR_MHPMCOUNTER11]  = { "mhpmcounter11",  mctr,   read_hpmcounter,
>>                                                          write_mhpmcounter },
>> -    [CSR_MHPMCOUNTER12]  = { "mhpmcounter12",  mctr,    read_hpmcounter,
>> +    [CSR_MHPMCOUNTER12]  = { "mhpmcounter12",  mctr,   read_hpmcounter,
>>                                                          write_mhpmcounter },
>> -    [CSR_MHPMCOUNTER13]  = { "mhpmcounter13",  mctr,    read_hpmcounter,
>> +    [CSR_MHPMCOUNTER13]  = { "mhpmcounter13",  mctr,   read_hpmcounter,
>>                                                          write_mhpmcounter },
>> -    [CSR_MHPMCOUNTER14]  = { "mhpmcounter14",  mctr,    read_hpmcounter,
>> +    [CSR_MHPMCOUNTER14]  = { "mhpmcounter14",  mctr,   read_hpmcounter,
>>                                                          write_mhpmcounter },
>> -    [CSR_MHPMCOUNTER15]  = { "mhpmcounter15",  mctr,    read_hpmcounter,
>> +    [CSR_MHPMCOUNTER15]  = { "mhpmcounter15",  mctr,   read_hpmcounter,
>>                                                          write_mhpmcounter },
>> -    [CSR_MHPMCOUNTER16]  = { "mhpmcounter16",  mctr,    read_hpmcounter,
>> +    [CSR_MHPMCOUNTER16]  = { "mhpmcounter16",  mctr,   read_hpmcounter,
>>                                                          write_mhpmcounter },
>> -    [CSR_MHPMCOUNTER17]  = { "mhpmcounter17",  mctr,    read_hpmcounter,
>> +    [CSR_MHPMCOUNTER17]  = { "mhpmcounter17",  mctr,   read_hpmcounter,
>>                                                          write_mhpmcounter },
>> -    [CSR_MHPMCOUNTER18]  = { "mhpmcounter18",  mctr,    read_hpmcounter,
>> +    [CSR_MHPMCOUNTER18]  = { "mhpmcounter18",  mctr,   read_hpmcounter,
>>                                                          write_mhpmcounter },
>> -    [CSR_MHPMCOUNTER19]  = { "mhpmcounter19",  mctr,    read_hpmcounter,
>> +    [CSR_MHPMCOUNTER19]  = { "mhpmcounter19",  mctr,   read_hpmcounter,
>>                                                          write_mhpmcounter },
>> -    [CSR_MHPMCOUNTER20]  = { "mhpmcounter20",  mctr,    read_hpmcounter,
>> +    [CSR_MHPMCOUNTER20]  = { "mhpmcounter20",  mctr,   read_hpmcounter,
>>                                                          write_mhpmcounter },
>> -    [CSR_MHPMCOUNTER21]  = { "mhpmcounter21",  mctr,    read_hpmcounter,
>> +    [CSR_MHPMCOUNTER21]  = { "mhpmcounter21",  mctr,   read_hpmcounter,
>>                                                          write_mhpmcounter },
>> -    [CSR_MHPMCOUNTER22]  = { "mhpmcounter22",  mctr,    read_hpmcounter,
>> +    [CSR_MHPMCOUNTER22]  = { "mhpmcounter22",  mctr,   read_hpmcounter,
>>                                                          write_mhpmcounter },
>> -    [CSR_MHPMCOUNTER23]  = { "mhpmcounter23",  mctr,    read_hpmcounter,
>> +    [CSR_MHPMCOUNTER23]  = { "mhpmcounter23",  mctr,   read_hpmcounter,
>>                                                          write_mhpmcounter },
>> -    [CSR_MHPMCOUNTER24]  = { "mhpmcounter24",  mctr,    read_hpmcounter,
>> +    [CSR_MHPMCOUNTER24]  = { "mhpmcounter24",  mctr,   read_hpmcounter,
>>                                                          write_mhpmcounter },
>> -    [CSR_MHPMCOUNTER25]  = { "mhpmcounter25",  mctr,    read_hpmcounter,
>> +    [CSR_MHPMCOUNTER25]  = { "mhpmcounter25",  mctr,   read_hpmcounter,
>>                                                          write_mhpmcounter },
>> -    [CSR_MHPMCOUNTER26]  = { "mhpmcounter26",  mctr,    read_hpmcounter,
>> +    [CSR_MHPMCOUNTER26]  = { "mhpmcounter26",  mctr,   read_hpmcounter,
>>                                                          write_mhpmcounter },
>> -    [CSR_MHPMCOUNTER27]  = { "mhpmcounter27",  mctr,    read_hpmcounter,
>> +    [CSR_MHPMCOUNTER27]  = { "mhpmcounter27",  mctr,   read_hpmcounter,
>>                                                          write_mhpmcounter },
>> -    [CSR_MHPMCOUNTER28]  = { "mhpmcounter28",  mctr,    read_hpmcounter,
>> +    [CSR_MHPMCOUNTER28]  = { "mhpmcounter28",  mctr,   read_hpmcounter,
>>                                                          write_mhpmcounter },
>> -    [CSR_MHPMCOUNTER29]  = { "mhpmcounter29",  mctr,    read_hpmcounter,
>> +    [CSR_MHPMCOUNTER29]  = { "mhpmcounter29",  mctr,   read_hpmcounter,
>>                                                          write_mhpmcounter },
>> -    [CSR_MHPMCOUNTER30]  = { "mhpmcounter30",  mctr,    read_hpmcounter,
>> +    [CSR_MHPMCOUNTER30]  = { "mhpmcounter30",  mctr,   read_hpmcounter,
>>                                                          write_mhpmcounter },
>> -    [CSR_MHPMCOUNTER31]  = { "mhpmcounter31",  mctr,    read_hpmcounter,
>> +    [CSR_MHPMCOUNTER31]  = { "mhpmcounter31",  mctr,   read_hpmcounter,
>>                                                          write_mhpmcounter },
>>
>> -    [CSR_MCOUNTINHIBIT]  = { "mcountinhibit",  any, read_mcountinhibit,
>> +    [CSR_MCOUNTINHIBIT]  = { "mcountinhibit",  any,    read_mcountinhibit,
>>                  write_mcountinhibit, .min_priv_ver = PRIV_VERSION_1_11_0  },
>>
>>       [CSR_MHPMEVENT3]     = { "mhpmevent3",     any,    read_mhpmevent,
>> @@ -3891,63 +3921,63 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>>       [CSR_HPMCOUNTER30H]  = { "hpmcounter30h",  ctr32,  read_hpmcounterh },
>>       [CSR_HPMCOUNTER31H]  = { "hpmcounter31h",  ctr32,  read_hpmcounterh },
>>
>> -    [CSR_MHPMCOUNTER3H]  = { "mhpmcounter3h",  mctr32,  read_hpmcounterh,
>> +    [CSR_MHPMCOUNTER3H]  = { "mhpmcounter3h",  mctr32, read_hpmcounterh,
>>                                                          write_mhpmcounterh },
>> -    [CSR_MHPMCOUNTER4H]  = { "mhpmcounter4h",  mctr32,  read_hpmcounterh,
>> +    [CSR_MHPMCOUNTER4H]  = { "mhpmcounter4h",  mctr32, read_hpmcounterh,
>>                                                          write_mhpmcounterh },
>> -    [CSR_MHPMCOUNTER5H]  = { "mhpmcounter5h",  mctr32,  read_hpmcounterh,
>> +    [CSR_MHPMCOUNTER5H]  = { "mhpmcounter5h",  mctr32, read_hpmcounterh,
>>                                                          write_mhpmcounterh },
>> -    [CSR_MHPMCOUNTER6H]  = { "mhpmcounter6h",  mctr32,  read_hpmcounterh,
>> +    [CSR_MHPMCOUNTER6H]  = { "mhpmcounter6h",  mctr32, read_hpmcounterh,
>>                                                          write_mhpmcounterh },
>> -    [CSR_MHPMCOUNTER7H]  = { "mhpmcounter7h",  mctr32,  read_hpmcounterh,
>> +    [CSR_MHPMCOUNTER7H]  = { "mhpmcounter7h",  mctr32, read_hpmcounterh,
>>                                                          write_mhpmcounterh },
>> -    [CSR_MHPMCOUNTER8H]  = { "mhpmcounter8h",  mctr32,  read_hpmcounterh,
>> +    [CSR_MHPMCOUNTER8H]  = { "mhpmcounter8h",  mctr32, read_hpmcounterh,
>>                                                          write_mhpmcounterh },
>> -    [CSR_MHPMCOUNTER9H]  = { "mhpmcounter9h",  mctr32,  read_hpmcounterh,
>> +    [CSR_MHPMCOUNTER9H]  = { "mhpmcounter9h",  mctr32, read_hpmcounterh,
>>                                                          write_mhpmcounterh },
>> -    [CSR_MHPMCOUNTER10H] = { "mhpmcounter10h", mctr32,  read_hpmcounterh,
>> +    [CSR_MHPMCOUNTER10H] = { "mhpmcounter10h", mctr32, read_hpmcounterh,
>>                                                          write_mhpmcounterh },
>> -    [CSR_MHPMCOUNTER11H] = { "mhpmcounter11h", mctr32,  read_hpmcounterh,
>> +    [CSR_MHPMCOUNTER11H] = { "mhpmcounter11h", mctr32, read_hpmcounterh,
>>                                                          write_mhpmcounterh },
>> -    [CSR_MHPMCOUNTER12H] = { "mhpmcounter12h", mctr32,  read_hpmcounterh,
>> +    [CSR_MHPMCOUNTER12H] = { "mhpmcounter12h", mctr32, read_hpmcounterh,
>>                                                          write_mhpmcounterh },
>> -    [CSR_MHPMCOUNTER13H] = { "mhpmcounter13h", mctr32,  read_hpmcounterh,
>> +    [CSR_MHPMCOUNTER13H] = { "mhpmcounter13h", mctr32, read_hpmcounterh,
>>                                                          write_mhpmcounterh },
>> -    [CSR_MHPMCOUNTER14H] = { "mhpmcounter14h", mctr32,  read_hpmcounterh,
>> +    [CSR_MHPMCOUNTER14H] = { "mhpmcounter14h", mctr32, read_hpmcounterh,
>>                                                          write_mhpmcounterh },
>> -    [CSR_MHPMCOUNTER15H] = { "mhpmcounter15h", mctr32,  read_hpmcounterh,
>> +    [CSR_MHPMCOUNTER15H] = { "mhpmcounter15h", mctr32, read_hpmcounterh,
>>                                                          write_mhpmcounterh },
>> -    [CSR_MHPMCOUNTER16H] = { "mhpmcounter16h", mctr32,  read_hpmcounterh,
>> +    [CSR_MHPMCOUNTER16H] = { "mhpmcounter16h", mctr32, read_hpmcounterh,
>>                                                          write_mhpmcounterh },
>> -    [CSR_MHPMCOUNTER17H] = { "mhpmcounter17h", mctr32,  read_hpmcounterh,
>> +    [CSR_MHPMCOUNTER17H] = { "mhpmcounter17h", mctr32, read_hpmcounterh,
>>                                                          write_mhpmcounterh },
>> -    [CSR_MHPMCOUNTER18H] = { "mhpmcounter18h", mctr32,  read_hpmcounterh,
>> +    [CSR_MHPMCOUNTER18H] = { "mhpmcounter18h", mctr32, read_hpmcounterh,
>>                                                          write_mhpmcounterh },
>> -    [CSR_MHPMCOUNTER19H] = { "mhpmcounter19h", mctr32,  read_hpmcounterh,
>> +    [CSR_MHPMCOUNTER19H] = { "mhpmcounter19h", mctr32, read_hpmcounterh,
>>                                                          write_mhpmcounterh },
>> -    [CSR_MHPMCOUNTER20H] = { "mhpmcounter20h", mctr32,  read_hpmcounterh,
>> +    [CSR_MHPMCOUNTER20H] = { "mhpmcounter20h", mctr32, read_hpmcounterh,
>>                                                          write_mhpmcounterh },
>> -    [CSR_MHPMCOUNTER21H] = { "mhpmcounter21h", mctr32,  read_hpmcounterh,
>> +    [CSR_MHPMCOUNTER21H] = { "mhpmcounter21h", mctr32, read_hpmcounterh,
>>                                                          write_mhpmcounterh },
>> -    [CSR_MHPMCOUNTER22H] = { "mhpmcounter22h", mctr32,  read_hpmcounterh,
>> +    [CSR_MHPMCOUNTER22H] = { "mhpmcounter22h", mctr32, read_hpmcounterh,
>>                                                          write_mhpmcounterh },
>> -    [CSR_MHPMCOUNTER23H] = { "mhpmcounter23h", mctr32,  read_hpmcounterh,
>> +    [CSR_MHPMCOUNTER23H] = { "mhpmcounter23h", mctr32, read_hpmcounterh,
>>                                                          write_mhpmcounterh },
>> -    [CSR_MHPMCOUNTER24H] = { "mhpmcounter24h", mctr32,  read_hpmcounterh,
>> +    [CSR_MHPMCOUNTER24H] = { "mhpmcounter24h", mctr32, read_hpmcounterh,
>>                                                          write_mhpmcounterh },
>> -    [CSR_MHPMCOUNTER25H] = { "mhpmcounter25h", mctr32,  read_hpmcounterh,
>> +    [CSR_MHPMCOUNTER25H] = { "mhpmcounter25h", mctr32, read_hpmcounterh,
>>                                                          write_mhpmcounterh },
>> -    [CSR_MHPMCOUNTER26H] = { "mhpmcounter26h", mctr32,  read_hpmcounterh,
>> +    [CSR_MHPMCOUNTER26H] = { "mhpmcounter26h", mctr32, read_hpmcounterh,
>>                                                          write_mhpmcounterh },
>> -    [CSR_MHPMCOUNTER27H] = { "mhpmcounter27h", mctr32,  read_hpmcounterh,
>> +    [CSR_MHPMCOUNTER27H] = { "mhpmcounter27h", mctr32, read_hpmcounterh,
>>                                                          write_mhpmcounterh },
>> -    [CSR_MHPMCOUNTER28H] = { "mhpmcounter28h", mctr32,  read_hpmcounterh,
>> +    [CSR_MHPMCOUNTER28H] = { "mhpmcounter28h", mctr32, read_hpmcounterh,
>>                                                          write_mhpmcounterh },
>> -    [CSR_MHPMCOUNTER29H] = { "mhpmcounter29h", mctr32,  read_hpmcounterh,
>> +    [CSR_MHPMCOUNTER29H] = { "mhpmcounter29h", mctr32, read_hpmcounterh,
>>                                                          write_mhpmcounterh },
>> -    [CSR_MHPMCOUNTER30H] = { "mhpmcounter30h", mctr32,  read_hpmcounterh,
>> +    [CSR_MHPMCOUNTER30H] = { "mhpmcounter30h", mctr32, read_hpmcounterh,
>>                                                          write_mhpmcounterh },
>> -    [CSR_MHPMCOUNTER31H] = { "mhpmcounter31h", mctr32,  read_hpmcounterh,
>> +    [CSR_MHPMCOUNTER31H] = { "mhpmcounter31h", mctr32, read_hpmcounterh,
>>                                                          write_mhpmcounterh },
>>   #endif /* !CONFIG_USER_ONLY */
>>   };
>> --
>> 2.17.1
>>
>>


