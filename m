Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE662C77B7A
	for <qemu-riscv@archiver.kernel.org>; Wed, 24 May 2023 06:19:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q1hq9-00030b-8Z; Wed, 24 May 2023 02:19:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q1hpx-0002to-2X; Wed, 24 May 2023 02:19:05 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q1hps-0004OS-QG; Wed, 24 May 2023 02:19:03 -0400
Received: from [192.168.0.120] (unknown [61.165.37.98])
 by APP-01 (Coremail) with SMTP id qwCowAAHV6BJrG1kcc9iBA--.38543S2;
 Wed, 24 May 2023 14:18:49 +0800 (CST)
Message-ID: <b4e279b8-b6c9-65bd-0432-1e4bcbc0eb6e@iscas.ac.cn>
Date: Wed, 24 May 2023 14:18:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Cc: liweiwei@iscas.ac.cn, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 frank.chang@sifive.com, alistair.francis@wdc.com, apatel@ventanamicro.com,
 palmer@rivosinc.com, dbarboza@ventanamicro.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com
Subject: Re: [PATCH 1/2] target/riscv: Add a function to refresh the dynamic
 CSRs xml.
Content-Language: en-US
To: Tommy Wu <tommy.wu@sifive.com>
References: <20230523114454.717708-1-tommy.wu@sifive.com>
 <20230523114454.717708-2-tommy.wu@sifive.com>
 <5d3558a0-8b7f-8b84-a4e0-a6f4404a56b6@iscas.ac.cn>
 <CANj3q_=E_TfaHLn4rHQp4jy5U0LXoXCFDjYVwh7c85h_oB_F7Q@mail.gmail.com>
 <cae11418-a33c-f35f-1604-a9b241f452a5@iscas.ac.cn>
 <CANj3q_==LB7v7-OGtjWbNO5NUzTz--capnGZnnbiV+kru_Ayhg@mail.gmail.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
In-Reply-To: <CANj3q_==LB7v7-OGtjWbNO5NUzTz--capnGZnnbiV+kru_Ayhg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAAHV6BJrG1kcc9iBA--.38543S2
X-Coremail-Antispam: 1UD129KBjvJXoW3ArWrJF1xWr13Ww4xCrW5trb_yoW7Xry8pr
 4vyay5CryrCr97Awn3JryUXFy5Jr15G3WDurWkZFy7Jr4UXw1Yvr4qgFnFgw15Gw4fKr1j
 vr1jgrsrZr47Ar7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9E14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
 1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
 n2IY04v7Mxk0xIA0c2IEe2xFo4CEbIxvr21lc2xSY4AK67AK6r47MxAIw28IcxkI7VAKI4
 8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
 wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjx
 v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20E
 Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
 AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjHUDJUUUUU==
X-Originating-IP: [61.165.37.98]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.089,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org


On 2023/5/24 13:35, Tommy Wu wrote:
>
> Hi WeiWei Li,
>
> When the CPU is realizing, it will call `riscv_gen_dynamic_csr_xml` 
> for the first time with the correct `base_reg` value.
>
>
> code flow :
>
> riscv_cpu_realize
>
> → riscv_cpu_register_gdb_regs_for_features
>
>      → riscv_gen_dynamic_csr_xml
>
>
> The functionality of `cpu->dyn_csr_base_reg` is to record the 
> `base_reg` from
>
> `riscv_cpu_register_gdb_regs_for_features`.
>
>
> When we try to refresh the dynamic CSRs xml, we will call the function 
> `riscv_gen_dynamic_csr_xml`
>
> for the second time, and then we can give the correct `base_reg` value 
> to the function
>
> `riscv_gen_dynamic_csr_xml`, because we've record this value in the 
> `cpu->dyn_csr_base_reg`.
>
Oh. Sorry, I stuck.

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Weiwei Li

>
> Best Regards,
>
> Tommy
>
>
>
> On Wed, May 24, 2023 at 10:10 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
>
>     On 2023/5/24 09:59, Tommy Wu wrote:
>     > Hi Weiwei Li,
>     >
>     > `dyn_csr_base_reg` will be used in `riscv_refresh_dynamic_csr_xml`
>     > We can initialize this variable when the cpu is realized.
>     I didn't find this initialization in following code.
>     > And used this variable in `riscv_refresh_dynamic_csr_xml`.
>
>     That's my question. In riscv_refresh_dynamic_csr_xml() ,
>     cpu->dyn_csr_base_reg is passed to riscv_gen_dynamic_csr_xml() as
>     base_reg.
>
>     And then base_reg is assigned to cpu->dyn_csr_base_reg again in
>     it. So
>     it's unchanged in this progress.
>
>     Another question is  dyn_csr_base_reg seems have no additional
>     function
>     currently.
>
>     Regards,
>
>     Weiwei Li
>
>     >
>     > Best regards,
>     > Tommy
>     >
>     >
>     > On Tue, May 23, 2023 at 10:38 PM Weiwei Li
>     <liweiwei@iscas.ac.cn> wrote:
>     >
>     >
>     >     On 2023/5/23 19:44, Tommy Wu wrote:
>     >     > When we change the cpu extension state after the cpu is
>     >     > realized, we cannot print the value of some CSRs in the remote
>     >     > gdb debugger. The root cause is that the dynamic CSR xml is
>     >     > generated when the cpu is realized.
>     >     >
>     >     > This patch add a function to refresh the dynamic CSR xml after
>     >     > the cpu is realized.
>     >     >
>     >     > Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
>     >     > Reviewed-by: Frank Chang <frank.chang@sifive.com>
>     >     > ---
>     >     >   target/riscv/cpu.h     |  2 ++
>     >     >   target/riscv/gdbstub.c | 12 ++++++++++++
>     >     >   2 files changed, 14 insertions(+)
>     >     >
>     >     > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>     >     > index de7e43126a..dc8e592275 100644
>     >     > --- a/target/riscv/cpu.h
>     >     > +++ b/target/riscv/cpu.h
>     >     > @@ -494,6 +494,7 @@ struct ArchCPU {
>     >     >       CPUNegativeOffsetState neg;
>     >     >       CPURISCVState env;
>     >     >
>     >     > +    int dyn_csr_base_reg;
>     >
>     >     dyn_csr_base_reg  seems have no additional effect on the
>     function.
>     >
>     >     And It remains unmodified in following
>     >     riscv_refresh_dynamic_csr_xml().
>     >
>     >     Regards,
>     >
>     >     Weiwei Li
>     >
>     >     >       char *dyn_csr_xml;
>     >     >       char *dyn_vreg_xml;
>     >     >
>     >     > @@ -781,6 +782,7 @@ void riscv_get_csr_ops(int csrno,
>     >     riscv_csr_operations *ops);
>     >     >   void riscv_set_csr_ops(int csrno, riscv_csr_operations
>     *ops);
>     >     >
>     >     >   void riscv_cpu_register_gdb_regs_for_features(CPUState *cs);
>     >     > +void riscv_refresh_dynamic_csr_xml(CPUState *cs);
>     >     >
>     >     >   uint8_t satp_mode_max_from_map(uint32_t map);
>     >     >   const char *satp_mode_str(uint8_t satp_mode, bool
>     is_32_bit);
>     >     > diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
>     >     > index 524bede865..9e97ee2c35 100644
>     >     > --- a/target/riscv/gdbstub.c
>     >     > +++ b/target/riscv/gdbstub.c
>     >     > @@ -230,6 +230,8 @@ static int
>     >     riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
>     >     >           bitsize = 64;
>     >     >       }
>     >     >
>     >     > +    cpu->dyn_csr_base_reg = base_reg;
>     >     > +
>     >     >       g_string_printf(s, "<?xml version=\"1.0\"?>");
>     >     >       g_string_append_printf(s, "<!DOCTYPE feature SYSTEM
>     >     \"gdb-target.dtd\">");
>     >     >       g_string_append_printf(s, "<feature
>     >     name=\"org.gnu.gdb.riscv.csr\">");
>     >     > @@ -349,3 +351,13 @@ void
>     >     riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
>     >     > "riscv-csr.xml", 0);
>     >     >       }
>     >     >   }
>     >     > +
>     >     > +void riscv_refresh_dynamic_csr_xml(CPUState *cs)
>     >     > +{
>     >     > +    RISCVCPU *cpu = RISCV_CPU(cs);
>     >     > +    if (!cpu->dyn_csr_xml) {
>     >     > +        g_assert_not_reached();
>     >     > +    }
>     >     > +    g_free(cpu->dyn_csr_xml);
>     >     > +    riscv_gen_dynamic_csr_xml(cs, cpu->dyn_csr_base_reg);
>     >     > +}
>     >
>


