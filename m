Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 011F4C7EE23
	for <qemu-riscv@archiver.kernel.org>; Wed, 24 May 2023 02:35:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q1eKp-0003SH-1Y; Tue, 23 May 2023 22:34:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q1eKn-0003RG-Ry; Tue, 23 May 2023 22:34:41 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q1eKl-0001bL-2i; Tue, 23 May 2023 22:34:41 -0400
Received: from [192.168.0.120] (unknown [61.165.37.98])
 by APP-05 (Coremail) with SMTP id zQCowACHjpK0d21k2mkABA--.23069S2;
 Wed, 24 May 2023 10:34:29 +0800 (CST)
Message-ID: <858ea86b-0bd7-5101-2948-6d3f5aa55aec@iscas.ac.cn>
Date: Wed, 24 May 2023 10:34:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Cc: liweiwei@iscas.ac.cn, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 frank.chang@sifive.com, alistair.francis@wdc.com, apatel@ventanamicro.com,
 palmer@rivosinc.com, dbarboza@ventanamicro.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com
Subject: Re: [PATCH 2/2] hw/intc: riscv_imsic: Refresh the CSRs xml after
 updating the state of the cpu.
Content-Language: en-US
To: Tommy Wu <tommy.wu@sifive.com>
References: <20230523114454.717708-1-tommy.wu@sifive.com>
 <20230523114454.717708-3-tommy.wu@sifive.com>
 <a1c36ae3-7875-0178-fcca-33abed1816f2@iscas.ac.cn>
 <CANj3q_nn5puBEdfzCgwUtT9bkhUUzopf-2qa0xC7LcRs_i_uhw@mail.gmail.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
In-Reply-To: <CANj3q_nn5puBEdfzCgwUtT9bkhUUzopf-2qa0xC7LcRs_i_uhw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowACHjpK0d21k2mkABA--.23069S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ar1rZrWkJF1UXr4xGw1DAwb_yoW8uryfpr
 s3CFWakFykGF1fZwsayF1rXFW5Zr1UG3W5Wr98Ga4UJrWDXw4FqrWDWw1vgF1DWFWxKr1a
 vr1jgFW2vF17AaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
 n2kIc2xKxwCYjI0SjxkI62AI1cAE67vIY487MxkIecxEwVAFwVW8JwCF04k20xvY0x0EwI
 xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
 Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
 IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k2
 6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
 AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUHWlkUUUUU=
X-Originating-IP: [61.165.37.98]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.089,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


On 2023/5/24 09:51, Tommy Wu wrote:
> Hi Weiwei Li,
> Yes, you're right,  `riscv_refresh_dynamic_csr_xml()`  can only be 
> called when
> cpu->dyn_csr_xml isn't a NULL pointer here.
>
> The cpu->dyn_csr_xml will be set when the cpu is realized.

Yeah, It will  be set only when Zicsr is supported.  And I think aia 
requires Zicsr.

However, another question:  whether we should add a check in 
riscv_imsic.c that it requires Zicsr?

Regards,

Weiwei Li

>
> Best Regards,
> Tommy
>
>
> On Tue, May 23, 2023 at 10:44 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
>
>     On 2023/5/23 19:44, Tommy Wu wrote:
>     > Originally, when we set the ext_smaia to true, we still cannot
>     print the
>     > AIA CSRs in the remote gdb debugger, because the dynamic CSR xml is
>     > generated when the cpu is realized.
>     >
>     > This patch refreshes the dynamic CSR xml after we update the
>     ext_smaia,
>     > so that we can print the AIA CSRs in the remote gdb debugger.
>     >
>     > Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
>     > Reviewed-by: Frank Chang <frank.chang@sifive.com>
>     > ---
>     >   hw/intc/riscv_imsic.c | 4 ++++
>     >   1 file changed, 4 insertions(+)
>     >
>     > diff --git a/hw/intc/riscv_imsic.c b/hw/intc/riscv_imsic.c
>     > index fea3385b51..97a51d535b 100644
>     > --- a/hw/intc/riscv_imsic.c
>     > +++ b/hw/intc/riscv_imsic.c
>     > @@ -350,6 +350,10 @@ static void riscv_imsic_realize(DeviceState
>     *dev, Error **errp)
>     >           } else {
>     >               rcpu->cfg.ext_smaia = true;
>     >           }
>     > +
>     > +        /* Refresh the dynamic csr xml for the gdbstub. */
>     > +        riscv_refresh_dynamic_csr_xml(cpu);
>     > +
>
>     There is an assert in riscv_refresh_dynamic_csr_xml():
>
>     +    if (!cpu->dyn_csr_xml) {
>     +        g_assert_not_reached();
>     +    }
>
>     So I think riscv_refresh_dynamic_csr_xml() can only be called when
>     cpu->dyn_csr_xml is true here.
>
>     Regards,
>
>     Weiwei Li
>
>     >           riscv_cpu_set_aia_ireg_rmw_fn(env, (imsic->mmode) ?
>     PRV_M : PRV_S,
>     >                                         riscv_imsic_rmw, imsic);
>     >       }
>


