Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n8N23-00067J-Dp
	for mharc-qemu-riscv@gnu.org; Fri, 14 Jan 2022 08:54:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n8N21-00060m-Dd; Fri, 14 Jan 2022 08:54:17 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25]:39702 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n8N1x-0000VM-CO; Fri, 14 Jan 2022 08:54:17 -0500
Received: from [192.168.0.104] (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowAA3FxRygOFhhN02Bg--.48554S2;
 Fri, 14 Jan 2022 21:53:55 +0800 (CST)
Subject: Re: [PATCH v3 2/3] target/riscv: add support for svinval extension
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 wangjunqiang@iscas.ac.cn, =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?=
 <lazyparser@gmail.com>
References: <20220114014059.23300-1-liweiwei@iscas.ac.cn>
 <20220114014059.23300-3-liweiwei@iscas.ac.cn>
 <CAAhSdy0KEm=CeG4TCLdyf1i_aO-pKG9N5yYQU6_OLPE44fQi-g@mail.gmail.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <a67b7ae3-e741-487d-765a-9fc98e53ca95@iscas.ac.cn>
Date: Fri, 14 Jan 2022 21:53:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAAhSdy0KEm=CeG4TCLdyf1i_aO-pKG9N5yYQU6_OLPE44fQi-g@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------A72897F13C693D0E1B0924C9"
Content-Language: en-US
X-CM-TRANSID: zQCowAA3FxRygOFhhN02Bg--.48554S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Jw4UCr17WFWfKFWruFWfKrg_yoW7uFy7pF
 4DKFy7Cr4kJFyfAayftr45JFW7Grs3CayUG3savwn5Xa15WrWDJr1kKrW3KrW5XF4kWr1Y
 9F4jyr90krW0qaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21lYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2
 jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II
 8E6IAqYI8I648v4I1lFcxC0VAYjxAxZF0Ew4CEw7xC0wCjr7xvwVCIw2I0I7xG6c02F41l
 c7I2V7IY0VAS07AlzVAYIcxG8wCY1x0264kExVAvwVAq07x20xyl42xK82IYc2Ij64vIr4
 1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUGVWUWwC20s026x8GjcxK
 67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
 8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAv
 wI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
 AFwI0_Gr0_Gr1UMVCEFcxC0VAYjxAxZFUvcSsGvfC2KfnxnUUI43ZEXa7VUjpuWJUUUUU=
 =
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 14 Jan 2022 13:54:17 -0000

This is a multi-part message in MIME format.
--------------A72897F13C693D0E1B0924C9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Thanks for your comments.

在 2022/1/14 下午9:40, Anup Patel 写道:
> On Fri, Jan 14, 2022 at 7:11 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>> ---
>>   target/riscv/cpu.c                          |  1 +
>>   target/riscv/cpu.h                          |  1 +
>>   target/riscv/insn32.decode                  |  7 ++
>>   target/riscv/insn_trans/trans_svinval.c.inc | 75 +++++++++++++++++++++
>>   target/riscv/translate.c                    |  1 +
>>   5 files changed, 85 insertions(+)
>>   create mode 100644 target/riscv/insn_trans/trans_svinval.c.inc
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index ff6c86c85b..45ac98e06b 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -668,6 +668,7 @@ static Property riscv_cpu_properties[] = {
>>       DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
>>       DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
>>
>> +    DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
>>       DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
>>
>>       DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index d3d17cde82..c3d1845ca1 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -327,6 +327,7 @@ struct RISCVCPU {
>>           bool ext_counters;
>>           bool ext_ifencei;
>>           bool ext_icsr;
>> +        bool ext_svinval;
>>           bool ext_svnapot;
>>           bool ext_zfh;
>>           bool ext_zfhmin;
>> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
>> index 5bbedc254c..7a0351fde2 100644
>> --- a/target/riscv/insn32.decode
>> +++ b/target/riscv/insn32.decode
>> @@ -809,3 +809,10 @@ fcvt_l_h   1100010  00010 ..... ... ..... 1010011 @r2_rm
>>   fcvt_lu_h  1100010  00011 ..... ... ..... 1010011 @r2_rm
>>   fcvt_h_l   1101010  00010 ..... ... ..... 1010011 @r2_rm
>>   fcvt_h_lu  1101010  00011 ..... ... ..... 1010011 @r2_rm
>> +
>> +# *** Svinval Standard Extension ***
>> +sinval_vma        0001011 ..... ..... 000 00000 1110011 @sfence_vma
>> +sfence_w_inval    0001100 00000 00000 000 00000 1110011
>> +sfence_inval_ir   0001100 00001 00000 000 00000 1110011
>> +hinval_vvma       0011011 ..... ..... 000 00000 1110011 @hfence_vvma
> s/0011011/0010011/
>
>> +hinval_gvma       0111011 ..... ..... 000 00000 1110011 @hfence_gvma
> s/0111011/0110011/

Sorry. I didn't find the encodings for svinval instructions from the 
spec. So I get them from  spike 
(https://github.com/riscv-software-src/riscv-isa-sim/blob/master/riscv/encoding.h) 
which are as follows:

#defineMATCH_HINVAL_VVMA0x36000073
#defineMASK_HINVAL_VVMA0xfe007fff
#defineMATCH_HINVAL_GVMA0x76000073
#defineMASK_HINVAL_GVMA0xfe007fff
Are they not the latest encodings?
>> diff --git a/target/riscv/insn_trans/trans_svinval.c.inc b/target/riscv/insn_trans/trans_svinval.c.inc
>> new file mode 100644
>> index 0000000000..1dde665661
>> --- /dev/null
>> +++ b/target/riscv/insn_trans/trans_svinval.c.inc
>> @@ -0,0 +1,75 @@
>> +/*
>> + * RISC-V translation routines for the Svinval Standard Instruction Set.
>> + *
>> + * Copyright (c) 2020-2021 PLCT lab
>> + *
>> + * This program is free software; you can redistribute it and/or modify it
>> + * under the terms and conditions of the GNU General Public License,
>> + * version 2 or later, as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope it will be useful, but WITHOUT
>> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
>> + * more details.
>> + *
>> + * You should have received a copy of the GNU General Public License along with
>> + * this program.  If not, see <http://www.gnu.org/licenses/>.
>> + */
>> +
>> +#define REQUIRE_SVINVAL(ctx) do {                    \
>> +    if (!RISCV_CPU(ctx->cs)->cfg.ext_svinval) {      \
>> +        return false;                                \
>> +    }                                                \
>> +} while (0)
>> +
>> +static bool trans_sinval_vma(DisasContext *ctx, arg_sinval_vma *a)
>> +{
>> +    REQUIRE_SVINVAL(ctx);
>> +    /* Do the same as sfence.vma currently */
>> +    REQUIRE_EXT(ctx, RVS);
>> +#ifndef CONFIG_USER_ONLY
>> +    gen_helper_tlb_flush(cpu_env);
>> +    return true;
>> +#endif
>> +    return false;
>> +}
>> +
>> +static bool trans_sfence_w_inval(DisasContext *ctx, arg_sfence_w_inval *a)
>> +{
>> +    REQUIRE_SVINVAL(ctx);
>> +    REQUIRE_EXT(ctx, RVS);
>> +    /* Do nothing currently */
>> +    return true;
>> +}
>> +
>> +static bool trans_sfence_inval_ir(DisasContext *ctx, arg_sfence_inval_ir *a)
>> +{
>> +    REQUIRE_SVINVAL(ctx);
>> +    REQUIRE_EXT(ctx, RVS);
>> +    /* Do nothing currently */
>> +    return true;
>> +}
>> +
>> +static bool trans_hinval_vvma(DisasContext *ctx, arg_hinval_vvma *a)
>> +{
>> +    REQUIRE_SVINVAL(ctx);
>> +    /* Do the same as hfence.vvma currently */
>> +    REQUIRE_EXT(ctx, RVH);
>> +#ifndef CONFIG_USER_ONLY
>> +    gen_helper_hyp_tlb_flush(cpu_env);
>> +    return true;
>> +#endif
>> +    return false;
>> +}
>> +
>> +static bool trans_hinval_gvma(DisasContext *ctx, arg_hinval_gvma *a)
>> +{
>> +    REQUIRE_SVINVAL(ctx);
>> +    /* Do the same as hfence.gvma currently */
>> +    REQUIRE_EXT(ctx, RVH);
>> +#ifndef CONFIG_USER_ONLY
>> +    gen_helper_hyp_gvma_tlb_flush(cpu_env);
>> +    return true;
>> +#endif
>> +    return false;
>> +}
>> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
>> index 615048ec87..4e5a9660a4 100644
>> --- a/target/riscv/translate.c
>> +++ b/target/riscv/translate.c
>> @@ -838,6 +838,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
>>   #include "insn_trans/trans_rvb.c.inc"
>>   #include "insn_trans/trans_rvzfh.c.inc"
>>   #include "insn_trans/trans_privileged.c.inc"
>> +#include "insn_trans/trans_svinval.c.inc"
>>
>>   /* Include the auto-generated decoder for 16 bit insn */
>>   #include "decode-insn16.c.inc"
>> --
>> 2.17.1
>>
>>
> Apart from the minor mistake above, it looks good to me.
>
> Reviewed-by: Anup Patel <anup@brainfault.org>
>
> Regards,
> Anup

Regards,
Weiwei Li

--------------A72897F13C693D0E1B0924C9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNv
bnRlbnQ9InRleHQvaHRtbDsgY2hhcnNldD1VVEYtOCI+CiAgPC9oZWFkPgogIDxib2R5Pgog
ICAgPHA+VGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzLjxicj4KICAgIDwvcD4KICAgIDxkaXYg
Y2xhc3M9Im1vei1jaXRlLXByZWZpeCI+5ZyoIDIwMjIvMS8xNCDkuIvljYg5OjQwLCBBbnVw
IFBhdGVsIOWGmemBkzo8YnI+CiAgICA8L2Rpdj4KICAgIDxibG9ja3F1b3RlIHR5cGU9ImNp
dGUiCmNpdGU9Im1pZDpDQUFoU2R5MEtFbT1DZUc0VENMZHlmMWlfYU8tcEtHOU41eVlRVTZf
T0xQRTQ0ZlFpLWdAbWFpbC5nbWFpbC5jb20iPgogICAgICA8cHJlIGNsYXNzPSJtb3otcXVv
dGUtcHJlIiB3cmFwPSIiPk9uIEZyaSwgSmFuIDE0LCAyMDIyIGF0IDc6MTEgQU0gV2Vpd2Vp
IExpIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpsaXdl
aXdlaUBpc2Nhcy5hYy5jbiI+Jmx0O2xpd2Vpd2VpQGlzY2FzLmFjLmNuJmd0OzwvYT4gd3Jv
dGU6CjwvcHJlPgogICAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIj4KICAgICAgICA8cHJl
IGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPgpTaWduZWQtb2ZmLWJ5OiBXZWl3ZWkg
TGkgPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOmxpd2Vp
d2VpQGlzY2FzLmFjLmNuIj4mbHQ7bGl3ZWl3ZWlAaXNjYXMuYWMuY24mZ3Q7PC9hPgpTaWdu
ZWQtb2ZmLWJ5OiBKdW5xaWFuZyBXYW5nIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5
NkUiIGhyZWY9Im1haWx0bzp3YW5nanVucWlhbmdAaXNjYXMuYWMuY24iPiZsdDt3YW5nanVu
cWlhbmdAaXNjYXMuYWMuY24mZ3Q7PC9hPgotLS0KIHRhcmdldC9yaXNjdi9jcHUuYyAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgMSArCiB0YXJnZXQvcmlzY3YvY3B1LmggICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgIDEgKwogdGFyZ2V0L3Jpc2N2L2luc24zMi5kZWNvZGUg
ICAgICAgICAgICAgICAgICB8ICA3ICsrCiB0YXJnZXQvcmlzY3YvaW5zbl90cmFucy90cmFu
c19zdmludmFsLmMuaW5jIHwgNzUgKysrKysrKysrKysrKysrKysrKysrCiB0YXJnZXQvcmlz
Y3YvdHJhbnNsYXRlLmMgICAgICAgICAgICAgICAgICAgIHwgIDEgKwogNSBmaWxlcyBjaGFu
Z2VkLCA4NSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgdGFyZ2V0L3Jpc2N2
L2luc25fdHJhbnMvdHJhbnNfc3ZpbnZhbC5jLmluYwoKZGlmZiAtLWdpdCBhL3RhcmdldC9y
aXNjdi9jcHUuYyBiL3RhcmdldC9yaXNjdi9jcHUuYwppbmRleCBmZjZjODZjODViLi40NWFj
OThlMDZiIDEwMDY0NAotLS0gYS90YXJnZXQvcmlzY3YvY3B1LmMKKysrIGIvdGFyZ2V0L3Jp
c2N2L2NwdS5jCkBAIC02NjgsNiArNjY4LDcgQEAgc3RhdGljIFByb3BlcnR5IHJpc2N2X2Nw
dV9wcm9wZXJ0aWVzW10gPSB7CiAgICAgREVGSU5FX1BST1BfVUlOVDE2KCJ2bGVuIiwgUklT
Q1ZDUFUsIGNmZy52bGVuLCAxMjgpLAogICAgIERFRklORV9QUk9QX1VJTlQxNigiZWxlbiIs
IFJJU0NWQ1BVLCBjZmcuZWxlbiwgNjQpLAoKKyAgICBERUZJTkVfUFJPUF9CT09MKCJzdmlu
dmFsIiwgUklTQ1ZDUFUsIGNmZy5leHRfc3ZpbnZhbCwgZmFsc2UpLAogICAgIERFRklORV9Q
Uk9QX0JPT0woInN2bmFwb3QiLCBSSVNDVkNQVSwgY2ZnLmV4dF9zdm5hcG90LCBmYWxzZSks
CgogICAgIERFRklORV9QUk9QX0JPT0woInpiYSIsIFJJU0NWQ1BVLCBjZmcuZXh0X3piYSwg
dHJ1ZSksCmRpZmYgLS1naXQgYS90YXJnZXQvcmlzY3YvY3B1LmggYi90YXJnZXQvcmlzY3Yv
Y3B1LmgKaW5kZXggZDNkMTdjZGU4Mi4uYzNkMTg0NWNhMSAxMDA2NDQKLS0tIGEvdGFyZ2V0
L3Jpc2N2L2NwdS5oCisrKyBiL3RhcmdldC9yaXNjdi9jcHUuaApAQCAtMzI3LDYgKzMyNyw3
IEBAIHN0cnVjdCBSSVNDVkNQVSB7CiAgICAgICAgIGJvb2wgZXh0X2NvdW50ZXJzOwogICAg
ICAgICBib29sIGV4dF9pZmVuY2VpOwogICAgICAgICBib29sIGV4dF9pY3NyOworICAgICAg
ICBib29sIGV4dF9zdmludmFsOwogICAgICAgICBib29sIGV4dF9zdm5hcG90OwogICAgICAg
ICBib29sIGV4dF96Zmg7CiAgICAgICAgIGJvb2wgZXh0X3pmaG1pbjsKZGlmZiAtLWdpdCBh
L3RhcmdldC9yaXNjdi9pbnNuMzIuZGVjb2RlIGIvdGFyZ2V0L3Jpc2N2L2luc24zMi5kZWNv
ZGUKaW5kZXggNWJiZWRjMjU0Yy4uN2EwMzUxZmRlMiAxMDA2NDQKLS0tIGEvdGFyZ2V0L3Jp
c2N2L2luc24zMi5kZWNvZGUKKysrIGIvdGFyZ2V0L3Jpc2N2L2luc24zMi5kZWNvZGUKQEAg
LTgwOSwzICs4MDksMTAgQEAgZmN2dF9sX2ggICAxMTAwMDEwICAwMDAxMCAuLi4uLiAuLi4g
Li4uLi4gMTAxMDAxMSBAcjJfcm0KIGZjdnRfbHVfaCAgMTEwMDAxMCAgMDAwMTEgLi4uLi4g
Li4uIC4uLi4uIDEwMTAwMTEgQHIyX3JtCiBmY3Z0X2hfbCAgIDExMDEwMTAgIDAwMDEwIC4u
Li4uIC4uLiAuLi4uLiAxMDEwMDExIEByMl9ybQogZmN2dF9oX2x1ICAxMTAxMDEwICAwMDAx
MSAuLi4uLiAuLi4gLi4uLi4gMTAxMDAxMSBAcjJfcm0KKworIyAqKiogU3ZpbnZhbCBTdGFu
ZGFyZCBFeHRlbnNpb24gKioqCitzaW52YWxfdm1hICAgICAgICAwMDAxMDExIC4uLi4uIC4u
Li4uIDAwMCAwMDAwMCAxMTEwMDExIEBzZmVuY2Vfdm1hCitzZmVuY2Vfd19pbnZhbCAgICAw
MDAxMTAwIDAwMDAwIDAwMDAwIDAwMCAwMDAwMCAxMTEwMDExCitzZmVuY2VfaW52YWxfaXIg
ICAwMDAxMTAwIDAwMDAxIDAwMDAwIDAwMCAwMDAwMCAxMTEwMDExCitoaW52YWxfdnZtYSAg
ICAgICAwMDExMDExIC4uLi4uIC4uLi4uIDAwMCAwMDAwMCAxMTEwMDExIEBoZmVuY2VfdnZt
YQo8L3ByZT4KICAgICAgPC9ibG9ja3F1b3RlPgogICAgICA8cHJlIGNsYXNzPSJtb3otcXVv
dGUtcHJlIiB3cmFwPSIiPgpzLzAwMTEwMTEvMDAxMDAxMS8KCjwvcHJlPgogICAgICA8Ymxv
Y2txdW90ZSB0eXBlPSJjaXRlIj4KICAgICAgICA8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJl
IiB3cmFwPSIiPitoaW52YWxfZ3ZtYSAgICAgICAwMTExMDExIC4uLi4uIC4uLi4uIDAwMCAw
MDAwMCAxMTEwMDExIEBoZmVuY2VfZ3ZtYQo8L3ByZT4KICAgICAgPC9ibG9ja3F1b3RlPgog
ICAgICA8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPgpzLzAxMTEwMTEvMDEx
MDAxMS8KPC9wcmU+CiAgICA8L2Jsb2NrcXVvdGU+CiAgICA8cD5Tb3JyeS4gSSBkaWRuJ3Qg
ZmluZCB0aGUgZW5jb2RpbmdzIGZvciBzdmludmFsIGluc3RydWN0aW9ucyBmcm9tCiAgICAg
IHRoZSBzcGVjLiBTbyBJIGdldCB0aGVtIGZyb23CoCBzcGlrZQooPGEgY2xhc3M9Im1vei10
eHQtbGluay1mcmVldGV4dCIgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2LXNvZnR3
YXJlLXNyYy9yaXNjdi1pc2Etc2ltL2Jsb2IvbWFzdGVyL3Jpc2N2L2VuY29kaW5nLmgiPmh0
dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1zb2Z0d2FyZS1zcmMvcmlzY3YtaXNhLXNpbS9ibG9i
L21hc3Rlci9yaXNjdi9lbmNvZGluZy5oPC9hPikKICAgICAgd2hpY2ggYXJlIGFzIGZvbGxv
d3M6PC9wPgogICAgPGRpdiBzdHlsZT0iY29sb3I6ICMwMDAwMDA7YmFja2dyb3VuZC1jb2xv
cjogI2ZmZmZmZjtmb250LWZhbWlseTogJ0Ryb2lkIFNhbnMgTW9ubycsICdtb25vc3BhY2Un
LCBtb25vc3BhY2UsICdEcm9pZCBTYW5zIEZhbGxiYWNrJztmb250LXdlaWdodDogbm9ybWFs
O2ZvbnQtc2l6ZTogMTZweDtsaW5lLWhlaWdodDogMjJweDt3aGl0ZS1zcGFjZTogcHJlOyI+
PGRpdj48c3BhbiBzdHlsZT0iY29sb3I6ICNhZjAwZGI7Ij4jZGVmaW5lPC9zcGFuPjxzcGFu
IHN0eWxlPSJjb2xvcjogIzAwMDBmZjsiPiA8L3NwYW4+PHNwYW4gc3R5bGU9ImNvbG9yOiAj
MDAwMGZmOyI+TUFUQ0hfSElOVkFMX1ZWTUE8L3NwYW4+PHNwYW4gc3R5bGU9ImNvbG9yOiAj
MDAwMGZmOyI+IDwvc3Bhbj48c3BhbiBzdHlsZT0iY29sb3I6ICMwOTg2NTg7Ij4weDM2MDAw
MDczPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4gc3R5bGU9ImNvbG9yOiAjYWYwMGRiOyI+I2Rl
ZmluZTwvc3Bhbj48c3BhbiBzdHlsZT0iY29sb3I6ICMwMDAwZmY7Ij4gPC9zcGFuPjxzcGFu
IHN0eWxlPSJjb2xvcjogIzAwMDBmZjsiPk1BU0tfSElOVkFMX1ZWTUE8L3NwYW4+PHNwYW4g
c3R5bGU9ImNvbG9yOiAjMDAwMGZmOyI+ICA8L3NwYW4+PHNwYW4gc3R5bGU9ImNvbG9yOiAj
MDk4NjU4OyI+MHhmZTAwN2ZmZjwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuIHN0eWxlPSJjb2xv
cjogI2FmMDBkYjsiPiNkZWZpbmU8L3NwYW4+PHNwYW4gc3R5bGU9ImNvbG9yOiAjMDAwMGZm
OyI+IDwvc3Bhbj48c3BhbiBzdHlsZT0iY29sb3I6ICMwMDAwZmY7Ij5NQVRDSF9ISU5WQUxf
R1ZNQTwvc3Bhbj48c3BhbiBzdHlsZT0iY29sb3I6ICMwMDAwZmY7Ij4gPC9zcGFuPjxzcGFu
IHN0eWxlPSJjb2xvcjogIzA5ODY1ODsiPjB4NzYwMDAwNzM8L3NwYW4+PC9kaXY+PGRpdj48
c3BhbiBzdHlsZT0iY29sb3I6ICNhZjAwZGI7Ij4jZGVmaW5lPC9zcGFuPjxzcGFuIHN0eWxl
PSJjb2xvcjogIzAwMDBmZjsiPiA8L3NwYW4+PHNwYW4gc3R5bGU9ImNvbG9yOiAjMDAwMGZm
OyI+TUFTS19ISU5WQUxfR1ZNQTwvc3Bhbj48c3BhbiBzdHlsZT0iY29sb3I6ICMwMDAwZmY7
Ij4gIDwvc3Bhbj48c3BhbiBzdHlsZT0iY29sb3I6ICMwOTg2NTg7Ij4weGZlMDA3ZmZmPC9z
cGFuPjwvZGl2PjxkaXY+PHNwYW4gc3R5bGU9ImNvbG9yOiAjMDk4NjU4OyI+Cjwvc3Bhbj48
L2Rpdj48ZGl2PjxzcGFuIHN0eWxlPSJjb2xvcjogIzA5ODY1ODsiPjxmb250IGNvbG9yPSIj
MGUxNDEyIj5BcmUgdGhleSBub3QgdGhlIGxhdGVzdCBlbmNvZGluZ3M/PC9mb250Pjwvc3Bh
bj48L2Rpdj48L2Rpdj4KICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiCmNpdGU9Im1pZDpD
QUFoU2R5MEtFbT1DZUc0VENMZHlmMWlfYU8tcEtHOU41eVlRVTZfT0xQRTQ0ZlFpLWdAbWFp
bC5nbWFpbC5jb20iPgogICAgICA8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIi
Pgo8L3ByZT4KICAgICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+CiAgICAgICAgPHByZSBj
bGFzcz0ibW96LXF1b3RlLXByZSIgd3JhcD0iIj5kaWZmIC0tZ2l0IGEvdGFyZ2V0L3Jpc2N2
L2luc25fdHJhbnMvdHJhbnNfc3ZpbnZhbC5jLmluYyBiL3RhcmdldC9yaXNjdi9pbnNuX3Ry
YW5zL3RyYW5zX3N2aW52YWwuYy5pbmMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAw
MDAwMDAwMC4uMWRkZTY2NTY2MQotLS0gL2Rldi9udWxsCisrKyBiL3RhcmdldC9yaXNjdi9p
bnNuX3RyYW5zL3RyYW5zX3N2aW52YWwuYy5pbmMKQEAgLTAsMCArMSw3NSBAQAorLyoKKyAq
IFJJU0MtViB0cmFuc2xhdGlvbiByb3V0aW5lcyBmb3IgdGhlIFN2aW52YWwgU3RhbmRhcmQg
SW5zdHJ1Y3Rpb24gU2V0LgorICoKKyAqIENvcHlyaWdodCAoYykgMjAyMC0yMDIxIFBMQ1Qg
bGFiCisgKgorICogVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVk
aXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkgaXQKKyAqIHVuZGVyIHRoZSB0ZXJtcyBhbmQg
Y29uZGl0aW9ucyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UsCisgKiB2ZXJz
aW9uIDIgb3IgbGF0ZXIsIGFzIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3Vu
ZGF0aW9uLgorICoKKyAqIFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9w
ZSBpdCB3aWxsIGJlIHVzZWZ1bCwgYnV0IFdJVEhPVVQKKyAqIEFOWSBXQVJSQU5UWTsgd2l0
aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mIE1FUkNIQU5UQUJJTElUWSBvcgor
ICogRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlIEdOVSBHZW5l
cmFsIFB1YmxpYyBMaWNlbnNlIGZvcgorICogbW9yZSBkZXRhaWxzLgorICoKKyAqIFlvdSBz
aG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBM
aWNlbnNlIGFsb25nIHdpdGgKKyAqIHRoaXMgcHJvZ3JhbS4gIElmIG5vdCwgc2VlIDxhIGNs
YXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Imh0dHA6Ly93d3cuZ251Lm9yZy9s
aWNlbnNlcy8iPiZsdDtodHRwOi8vd3d3LmdudS5vcmcvbGljZW5zZXMvJmd0OzwvYT4uCisg
Ki8KKworI2RlZmluZSBSRVFVSVJFX1NWSU5WQUwoY3R4KSBkbyB7ICAgICAgICAgICAgICAg
ICAgICBcCisgICAgaWYgKCFSSVNDVl9DUFUoY3R4LSZndDtjcyktJmd0O2NmZy5leHRfc3Zp
bnZhbCkgeyAgICAgIFwKKyAgICAgICAgcmV0dXJuIGZhbHNlOyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXAorICAgIH0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcCit9IHdoaWxlICgwKQorCitzdGF0aWMgYm9vbCB0cmFuc19z
aW52YWxfdm1hKERpc2FzQ29udGV4dCAqY3R4LCBhcmdfc2ludmFsX3ZtYSAqYSkKK3sKKyAg
ICBSRVFVSVJFX1NWSU5WQUwoY3R4KTsKKyAgICAvKiBEbyB0aGUgc2FtZSBhcyBzZmVuY2Uu
dm1hIGN1cnJlbnRseSAqLworICAgIFJFUVVJUkVfRVhUKGN0eCwgUlZTKTsKKyNpZm5kZWYg
Q09ORklHX1VTRVJfT05MWQorICAgIGdlbl9oZWxwZXJfdGxiX2ZsdXNoKGNwdV9lbnYpOwor
ICAgIHJldHVybiB0cnVlOworI2VuZGlmCisgICAgcmV0dXJuIGZhbHNlOworfQorCitzdGF0
aWMgYm9vbCB0cmFuc19zZmVuY2Vfd19pbnZhbChEaXNhc0NvbnRleHQgKmN0eCwgYXJnX3Nm
ZW5jZV93X2ludmFsICphKQoreworICAgIFJFUVVJUkVfU1ZJTlZBTChjdHgpOworICAgIFJF
UVVJUkVfRVhUKGN0eCwgUlZTKTsKKyAgICAvKiBEbyBub3RoaW5nIGN1cnJlbnRseSAqLwor
ICAgIHJldHVybiB0cnVlOworfQorCitzdGF0aWMgYm9vbCB0cmFuc19zZmVuY2VfaW52YWxf
aXIoRGlzYXNDb250ZXh0ICpjdHgsIGFyZ19zZmVuY2VfaW52YWxfaXIgKmEpCit7CisgICAg
UkVRVUlSRV9TVklOVkFMKGN0eCk7CisgICAgUkVRVUlSRV9FWFQoY3R4LCBSVlMpOworICAg
IC8qIERvIG5vdGhpbmcgY3VycmVudGx5ICovCisgICAgcmV0dXJuIHRydWU7Cit9CisKK3N0
YXRpYyBib29sIHRyYW5zX2hpbnZhbF92dm1hKERpc2FzQ29udGV4dCAqY3R4LCBhcmdfaGlu
dmFsX3Z2bWEgKmEpCit7CisgICAgUkVRVUlSRV9TVklOVkFMKGN0eCk7CisgICAgLyogRG8g
dGhlIHNhbWUgYXMgaGZlbmNlLnZ2bWEgY3VycmVudGx5ICovCisgICAgUkVRVUlSRV9FWFQo
Y3R4LCBSVkgpOworI2lmbmRlZiBDT05GSUdfVVNFUl9PTkxZCisgICAgZ2VuX2hlbHBlcl9o
eXBfdGxiX2ZsdXNoKGNwdV9lbnYpOworICAgIHJldHVybiB0cnVlOworI2VuZGlmCisgICAg
cmV0dXJuIGZhbHNlOworfQorCitzdGF0aWMgYm9vbCB0cmFuc19oaW52YWxfZ3ZtYShEaXNh
c0NvbnRleHQgKmN0eCwgYXJnX2hpbnZhbF9ndm1hICphKQoreworICAgIFJFUVVJUkVfU1ZJ
TlZBTChjdHgpOworICAgIC8qIERvIHRoZSBzYW1lIGFzIGhmZW5jZS5ndm1hIGN1cnJlbnRs
eSAqLworICAgIFJFUVVJUkVfRVhUKGN0eCwgUlZIKTsKKyNpZm5kZWYgQ09ORklHX1VTRVJf
T05MWQorICAgIGdlbl9oZWxwZXJfaHlwX2d2bWFfdGxiX2ZsdXNoKGNwdV9lbnYpOworICAg
IHJldHVybiB0cnVlOworI2VuZGlmCisgICAgcmV0dXJuIGZhbHNlOworfQpkaWZmIC0tZ2l0
IGEvdGFyZ2V0L3Jpc2N2L3RyYW5zbGF0ZS5jIGIvdGFyZ2V0L3Jpc2N2L3RyYW5zbGF0ZS5j
CmluZGV4IDYxNTA0OGVjODcuLjRlNWE5NjYwYTQgMTAwNjQ0Ci0tLSBhL3RhcmdldC9yaXNj
di90cmFuc2xhdGUuYworKysgYi90YXJnZXQvcmlzY3YvdHJhbnNsYXRlLmMKQEAgLTgzOCw2
ICs4MzgsNyBAQCBzdGF0aWMgdWludDMyX3Qgb3Bjb2RlX2F0KERpc2FzQ29udGV4dEJhc2Ug
KmRjYmFzZSwgdGFyZ2V0X3Vsb25nIHBjKQogI2luY2x1ZGUgImluc25fdHJhbnMvdHJhbnNf
cnZiLmMuaW5jIgogI2luY2x1ZGUgImluc25fdHJhbnMvdHJhbnNfcnZ6ZmguYy5pbmMiCiAj
aW5jbHVkZSAiaW5zbl90cmFucy90cmFuc19wcml2aWxlZ2VkLmMuaW5jIgorI2luY2x1ZGUg
Imluc25fdHJhbnMvdHJhbnNfc3ZpbnZhbC5jLmluYyIKCiAvKiBJbmNsdWRlIHRoZSBhdXRv
LWdlbmVyYXRlZCBkZWNvZGVyIGZvciAxNiBiaXQgaW5zbiAqLwogI2luY2x1ZGUgImRlY29k
ZS1pbnNuMTYuYy5pbmMiCi0tCjIuMTcuMQoKCjwvcHJlPgogICAgICA8L2Jsb2NrcXVvdGU+
CiAgICAgIDxwcmUgY2xhc3M9Im1vei1xdW90ZS1wcmUiIHdyYXA9IiI+CkFwYXJ0IGZyb20g
dGhlIG1pbm9yIG1pc3Rha2UgYWJvdmUsIGl0IGxvb2tzIGdvb2QgdG8gbWUuCgpSZXZpZXdl
ZC1ieTogQW51cCBQYXRlbCA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVm
PSJtYWlsdG86YW51cEBicmFpbmZhdWx0Lm9yZyI+Jmx0O2FudXBAYnJhaW5mYXVsdC5vcmcm
Z3Q7PC9hPgoKUmVnYXJkcywKQW51cAo8L3ByZT4KICAgIDwvYmxvY2txdW90ZT4KICAgIDxi
cj4KICAgIDxkaXY+PHNwYW4gc3R5bGU9ImNvbG9yOiAjMDk4NjU4OyI+PGZvbnQgY29sb3I9
IiMwZTE0MTIiPlJlZ2FyZHMsPC9mb250Pjwvc3Bhbj48L2Rpdj4KICAgIDxkaXY+PHNwYW4g
c3R5bGU9ImNvbG9yOiAjMDk4NjU4OyI+PGZvbnQgY29sb3I9IiMwZTE0MTIiPldlaXdlaSBM
aTwvZm9udD48L3NwYW4+PC9kaXY+CiAgPC9ib2R5Pgo8L2h0bWw+Cg==
--------------A72897F13C693D0E1B0924C9--


