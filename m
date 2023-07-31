Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A01C001DE
	for <qemu-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 13:28:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qQSwW-0000TZ-3r; Mon, 31 Jul 2023 09:28:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qQSwU-0000T3-Ta
 for qemu-riscv@nongnu.org; Mon, 31 Jul 2023 09:28:10 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qQSwT-0005QQ-7a
 for qemu-riscv@nongnu.org; Mon, 31 Jul 2023 09:28:10 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3fe078dcc3aso27055365e9.2
 for <qemu-riscv@nongnu.org>; Mon, 31 Jul 2023 06:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690810086; x=1691414886;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8gMMA/S+lNdmt0rM5meRi6+/oF86zlRB/iWExxnovjs=;
 b=eKyept5pR0+LCuvgVtuHqz+gUkYvmH1fOnCKrWkN1C4/AHre8Gr9NuFwoqKkGNYnzM
 HGfZHqhlFvvuZUoDH5xVpuaNGge3GabK4g69MYb/eDBlK9MI7NIUn+fecjwmWhHwzOWd
 7WAuLe11k9DIdATZ0J/grBL5tZkDft8E8DtL5wwBTi60ja7v8XzfpE95Xh9nEIYqPlfQ
 lNwXEcxGkHpa+deZoQoz+P7iTnhh4hRqsTEw6bu0fPMBDNQDvtsbRnqVB45ynma1QbIU
 qwCPbmXoG9SII0AMySgmiCVxOvyH8luhT+xFnkbNDWc8io9dV5rqMiAmLUs+29ETR2p0
 MgSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690810086; x=1691414886;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8gMMA/S+lNdmt0rM5meRi6+/oF86zlRB/iWExxnovjs=;
 b=c0h71FmAflEFxwagXpfBIGeyrAF94dczY75Itjintsq86gefWYK38SRUxIcEfe8+5M
 tIRGlyF4lhDGt9yUuXlL2nFB+Uw0uQWr+MPdIjPrzY0N46RG0vG7Sozk53xe/asAqxQu
 t3k21Cg2I0PP1et7qRwVTd4gM7hgBqhXDSd1hvQuH3MJe1ahEjJYHmSjVl50iJ/TjMgN
 U9H2SMRsgEJUG5kt6erndoqFVdEqIsi9aTbeh+lslYfCh+nYtqDJXDB3z4o65cYDTiyL
 ttGMptlVJc6T6kMN4gKYTi/vDyh1qIWvT4HRPaM/hT4vuz4ptGmWAYqL5Pwxzrj6fses
 o2yA==
X-Gm-Message-State: ABy/qLYS7EERjBBEyoxHzpjacFOfxZbCNy8bJOC6cMRHi+zuN7t+Im6j
 y7RG4UeJ9YFgowlq58qpvUERDg==
X-Google-Smtp-Source: APBJJlHMwNoxRxepGnxKznkemeh+5H/tbO8K1yA/ssP05TfXPMen4vhX1EkgXRhaigZL+EBcbX0dSw==
X-Received: by 2002:a1c:7c1a:0:b0:3fc:f9c:a3e6 with SMTP id
 x26-20020a1c7c1a000000b003fc0f9ca3e6mr7632898wmc.9.1690810086070; 
 Mon, 31 Jul 2023 06:28:06 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.198.42])
 by smtp.gmail.com with ESMTPSA id
 f2-20020a7bc8c2000000b003fbc9b9699dsm11464862wml.45.2023.07.31.06.27.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jul 2023 06:28:05 -0700 (PDT)
Message-ID: <09cad822-85c2-3e0b-9414-e1da9de2a2d1@linaro.org>
Date: Mon, 31 Jul 2023 15:27:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 06/24] hw/core/cpu: Replace gdb_core_xml_file with
 gdb_core_feature
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Rolnik
 <mrolnik@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Brian Cain <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Laurent Vivier
 <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
 <20230731084354.115015-7-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230731084354.115015-7-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.101,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 31/7/23 10:43, Akihiko Odaki wrote:
> This is a tree-wide change to replace gdb_core_xml_file, the path to
> GDB XML file with gdb_core_feature, the pointer to GDBFeature. This
> also replaces the values assigned to gdb_num_core_regs with the
> num_regs member of GDBFeature where applicable to remove magic numbers.
> 
> A following change will utilize additional information provided by
> GDBFeature to simplify XML file lookup.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   include/hw/core/cpu.h   | 5 +++--
>   target/s390x/cpu.h      | 2 --
>   gdbstub/gdbstub.c       | 6 +++---
>   target/arm/cpu.c        | 4 ++--
>   target/arm/cpu64.c      | 4 ++--
>   target/arm/tcg/cpu32.c  | 3 ++-
>   target/avr/cpu.c        | 4 ++--
>   target/hexagon/cpu.c    | 2 +-
>   target/i386/cpu.c       | 7 +++----
>   target/loongarch/cpu.c  | 4 ++--
>   target/m68k/cpu.c       | 7 ++++---
>   target/microblaze/cpu.c | 4 ++--
>   target/ppc/cpu_init.c   | 4 ++--
>   target/riscv/cpu.c      | 7 ++++---
>   target/rx/cpu.c         | 4 ++--
>   target/s390x/cpu.c      | 4 ++--
>   16 files changed, 36 insertions(+), 35 deletions(-)


> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index d71a162070..a206ab6b1b 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2353,7 +2353,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
>   #ifndef CONFIG_USER_ONLY
>       cc->sysemu_ops = &arm_sysemu_ops;
>   #endif
> -    cc->gdb_num_core_regs = 26;
>       cc->gdb_arch_name = arm_gdb_arch_name;
>       cc->gdb_get_dynamic_xml = arm_gdb_get_dynamic_xml;
>       cc->gdb_stop_before_watchpoint = true;
> @@ -2378,7 +2377,8 @@ static void cpu_register_class_init(ObjectClass *oc, void *data)
>       CPUClass *cc = CPU_CLASS(acc);
>   
>       acc->info = data;
> -    cc->gdb_core_xml_file = "arm-core.xml";
> +    cc->gdb_core_feature = gdb_find_static_feature("arm-core.xml");

Can we have:

   cc->gdb_core_feature = gdb_find_static_feature(cc->gdb_core_xml_file);

once in hw/core/cpu-common.c::cpu_class_init()?

(haven't verified, just wondering)

> +    cc->gdb_num_core_regs = cc->gdb_core_feature->num_regs;
>   }



