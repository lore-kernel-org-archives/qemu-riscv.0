Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 487B0EE14D3
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 07:42:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qe9eH-0000AL-Jn; Thu, 07 Sep 2023 03:41:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=XW8m=EX=kaod.org=clg@ozlabs.org>)
 id 1qe9eD-00009N-R8; Thu, 07 Sep 2023 03:41:53 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=XW8m=EX=kaod.org=clg@ozlabs.org>)
 id 1qe9e8-0003Nl-Bf; Thu, 07 Sep 2023 03:41:51 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4RhB586wSpz4x2n;
 Thu,  7 Sep 2023 17:41:32 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4RhB4h6684z4x5m;
 Thu,  7 Sep 2023 17:41:08 +1000 (AEST)
Message-ID: <da39cd13-68cc-4aab-3aba-301180e81560@kaod.org>
Date: Thu, 7 Sep 2023 09:41:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 12/32] target/ppc: Use generic helper to show CPU model
 names
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, imp@bsdimp.com, kevans@freebsd.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, peter.maydell@linaro.org, b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com, kfting@nuvoton.com,
 wuhaotsh@google.com, nieklinnenbank@gmail.com, rad@semihalf.com,
 quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org, laurent@vivier.eu,
 vijai@behindbytes.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, richard.henderson@linaro.org,
 mrolnik@gmail.com, edgar.iglesias@gmail.com, bcain@quicinc.com,
 gaosong@loongson.cn, yangxiaojuan@loongson.cn, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, crwulff@gmail.com, marex@denx.de, shorne@gmail.com,
 david@gibson.dropbear.id.au, groug@kaod.org, npiggin@gmail.com,
 ysato@users.sourceforge.jp, david@redhat.com, thuth@redhat.com,
 iii@linux.ibm.com, mark.cave-ayland@ilande.co.uk, atar4qemu@gmail.com,
 kbastian@mail.uni-paderborn.de, jcmvbkbc@gmail.com, pbonzini@redhat.com,
 imammedo@redhat.com, shan.gavin@gmail.com
References: <20230907003553.1636896-1-gshan@redhat.com>
 <20230907003553.1636896-13-gshan@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230907003553.1636896-13-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=XW8m=EX=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.473, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 9/7/23 02:35, Gavin Shan wrote:
> For target/ppc, the CPU type name can be: (1) The combination of
> the CPU model name and suffix; (2) the type name of the class whose
> PVR matches with the specified one; (3) alias of the CPU model, plus
> suffix; (4) MachineClass::default_cpu_type when the CPU model name
> is "max". All the possible information, the CPU model name, aliases
> of the CPU models and PVRs are all shown in ppc_cpu_list_entry().
> 
> Use generic helper cpu_model_from_type() in ppc_cpu_list_entry(),
> and rename @name to @model since it points to the CPU model name
> instead of the CPU type name.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>

Looks good.

Reviewed-by: Cédric Le Goater <clg@kaod.org>


With a quick hack adding a valid_cpu_types list to the pseries machine,
QEMU reported:

   qemu-system-ppc64 -M pseries -cpu 460exb
   qemu-system-ppc64: Invalid CPU type: 460exb
   The valid types are: 970_v2.2, 970mp_v1.0, 970mp_v1.1, power5+_v2.1, power7_v2.3, power7+_v2.1, power8_v2.0, power8e_v2.1, power8nvl_v1.0, power9_v1.0, power9_v2.0, power9_v2.2, power10_v1.0, power10_v2.0

This would be a great improvement for the PPC boards since the CPU
definitions are numerous :

   $ install/bin/qemu-system-ppc64 -cpu ?  | wc -l
   418

and usually, the board only reports that the CPU specified on the
command line is not supported.

Thanks,

C.


> ---
>   target/ppc/cpu_init.c | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 02b7aad9b0..7281402331 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -7019,16 +7019,15 @@ static void ppc_cpu_list_entry(gpointer data, gpointer user_data)
>       PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
>       DeviceClass *family = DEVICE_CLASS(ppc_cpu_get_family_class(pcc));
>       const char *typename = object_class_get_name(oc);
> -    char *name;
> +    char *model;
>       int i;
>   
>       if (unlikely(strcmp(typename, TYPE_HOST_POWERPC_CPU) == 0)) {
>           return;
>       }
>   
> -    name = g_strndup(typename,
> -                     strlen(typename) - strlen(POWERPC_CPU_TYPE_SUFFIX));
> -    qemu_printf("PowerPC %-16s PVR %08x\n", name, pcc->pvr);
> +    model = cpu_model_from_type(typename);
> +    qemu_printf("PowerPC %-16s PVR %08x\n", model, pcc->pvr);
>       for (i = 0; ppc_cpu_aliases[i].alias != NULL; i++) {
>           PowerPCCPUAlias *alias = &ppc_cpu_aliases[i];
>           ObjectClass *alias_oc = ppc_cpu_class_by_name(alias->model);
> @@ -7045,10 +7044,10 @@ static void ppc_cpu_list_entry(gpointer data, gpointer user_data)
>                           alias->alias, family->desc);
>           } else {
>               qemu_printf("PowerPC %-16s (alias for %s)\n",
> -                        alias->alias, name);
> +                        alias->alias, model);
>           }
>       }
> -    g_free(name);
> +    g_free(model);
>   }
>   
>   void ppc_cpu_list(void)


