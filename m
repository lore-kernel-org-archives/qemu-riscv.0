Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD809C07548
	for <qemu-riscv@archiver.kernel.org>; Wed, 15 Nov 2023 11:19:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r3Dus-0006dw-V6; Wed, 15 Nov 2023 06:18:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1r3Duk-0006aA-UA; Wed, 15 Nov 2023 06:18:34 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1r3Dui-00066P-TU; Wed, 15 Nov 2023 06:18:34 -0500
Received: from zero.eik.bme.hu (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id CAE4775607B;
 Wed, 15 Nov 2023 12:18:55 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id BDDA4756078; Wed, 15 Nov 2023 12:18:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id BA6F8756066;
 Wed, 15 Nov 2023 12:18:55 +0100 (CET)
Date: Wed, 15 Nov 2023 12:18:55 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Gavin Shan <gshan@redhat.com>
cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-ppc@nongnu.org, imp@bsdimp.com, kevans@freebsd.org, 
 richard.henderson@linaro.org, pbonzini@redhat.com, 
 peter.maydell@linaro.org, imammedo@redhat.com, philmd@linaro.org, 
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com, 
 sundeep.lkml@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com, 
 nieklinnenbank@gmail.com, rad@semihalf.com, quic_llindhol@quicinc.com, 
 marcin.juszkiewicz@linaro.org, eduardo@habkost.net, 
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com, laurent@vivier.eu, 
 vijai@behindbytes.com, palmer@dabbelt.com, alistair.francis@wdc.com, 
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com, edgar.iglesias@gmail.com, 
 bcain@quicinc.com, gaosong@loongson.cn, aurelien@aurel32.net, 
 jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com, 
 chenhuacai@kernel.org, shorne@gmail.com, npiggin@gmail.com, clg@kaod.org, 
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de, 
 jcmvbkbc@gmail.com, shan.gavin@gmail.com
Subject: Re: [PATCH v5 02/31] target/hppa: Remove
 object_class_is_abstract()
In-Reply-To: <20231114235628.534334-3-gshan@redhat.com>
Message-ID: <35cae9bd-2240-2399-2212-e12f1683bf90@eik.bme.hu>
References: <20231114235628.534334-1-gshan@redhat.com>
 <20231114235628.534334-3-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Virus-Scanned: ClamAV using ClamSMTP
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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

On Wed, 15 Nov 2023, Gavin Shan wrote:
> No need to check if @oc is abstract because it has been covered
> by cpu_class_by_name().
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
> target/hppa/cpu.c | 1 -
> 1 file changed, 1 deletion(-)
>
> diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
> index 04de1689d7..fc4d2abad7 100644
> --- a/target/hppa/cpu.c
> +++ b/target/hppa/cpu.c
> @@ -163,7 +163,6 @@ static ObjectClass *hppa_cpu_class_by_name(const char *cpu_model)
>     ObjectClass *oc = object_class_by_name(typename);
>
>     if (oc &&
> -        !object_class_is_abstract(oc) &&
>         object_class_dynamic_cast(oc, TYPE_HPPA_CPU)) {

Might as well remove the line break as the remaining expression fits in 80 
chars.

Regards,
BALATON Zoltan

>         return oc;
>     }
>

