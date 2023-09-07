Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 371DDEE14D3
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 09:00:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qeArr-0007UC-VD; Thu, 07 Sep 2023 05:00:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qeAro-0007R6-UR
 for qemu-riscv@nongnu.org; Thu, 07 Sep 2023 05:00:00 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qeArm-0008TH-Mt
 for qemu-riscv@nongnu.org; Thu, 07 Sep 2023 05:00:00 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-401187f8071so4071785e9.0
 for <qemu-riscv@nongnu.org>; Thu, 07 Sep 2023 01:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694077197; x=1694681997; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0CQD7PKX+PtAuncOMuUkidNJvAacjAFK5clakTjB+AE=;
 b=hSCEyxDjmf/WqKiFz3SXmeKcmSUSHm1kXl+AB04Bnnw2SpTAP7ySpCEyt/S5NXtbgV
 j210ewP5bfeXZ/sCW/ZdNdHTF27tYsBv6qB4kDi0WyJ3QhxHgeTL6bIMwGPzFDzEtwlN
 gSuWzucSUOl95rIRlvCw8x2RRRqaorMHBsvD9Iiut3XY5YVTFs6jomP86KHaA7tBalIM
 A+VXYHdZKxTS//NwnlqxJdpx8GQVpakK4jAcCXDfxUk9lUQ/5l+EwXIv/ZnGHrWeJYP/
 jxyR1oQqlbRMSMwaD/iPER/Yf1tb7wo8I4RUz74ggTUiOPipJ2QAcFsv0c7zdmRBrIoD
 fJ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694077197; x=1694681997;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0CQD7PKX+PtAuncOMuUkidNJvAacjAFK5clakTjB+AE=;
 b=ObpGc7q9fy8QQfIPjGaPiXlJzGdbyzlg9Oz21KxaNchYVAVNrMoQisxHYxUTiHxOvD
 Jofl+KvtZZecj2PB/nHa8A0pmiXD5eNvw9e6/9yBzXwpaYcPxfpQCrADiqHiX6QWuydg
 CCNjoocPjZfwbjSVEZUwGXkx8eEyYAnkamNOjqcZn2rhJ+1NDIEVpvDEzEzz+IN6V210
 qLKO76tb3I4Usl80ZETlw6cVQe/AEP9F4N31IOneUIl8H5lEWIoXYzaCgZ4GRNvOWY5M
 YB52BEhReXui+a0cDOuOMjLFTBd4d/Dm7Dl+0bWNuWNqqV2S/ne4UVa+As4Tc6XjIkhJ
 GuMw==
X-Gm-Message-State: AOJu0YyvEWSOGVrmoJ20CxDwYZv9dfAH/jVvu0hXJCJJs9CLF6lyo4xs
 YBgQuwD9RrheSv6uQEtSuuo0FQ==
X-Google-Smtp-Source: AGHT+IF9fpvGsdxclBh7ho1BZUF5DRcw5z430gGU6cVuEfCPKfyEc0ULtMKzKLoLY7v8GE0Q0gaJGw==
X-Received: by 2002:a05:600c:4817:b0:3ff:a95b:9751 with SMTP id
 i23-20020a05600c481700b003ffa95b9751mr1558412wmo.7.1694077197061; 
 Thu, 07 Sep 2023 01:59:57 -0700 (PDT)
Received: from [192.168.69.115] (176-131-222-226.abo.bbox.fr.
 [176.131.222.226]) by smtp.gmail.com with ESMTPSA id
 t20-20020a1c7714000000b003fbc9d178a8sm1908930wmi.4.2023.09.07.01.59.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Sep 2023 01:59:56 -0700 (PDT)
Message-ID: <7ddd6d34-7539-9a67-7c99-296886c3bad5@linaro.org>
Date: Thu, 7 Sep 2023 10:59:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v3 28/32] hw/arm/virt: Check CPU type in
 machine_run_board_init()
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, imp@bsdimp.com, kevans@freebsd.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 peter.maydell@linaro.org, b.galvani@gmail.com,
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
 clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 npiggin@gmail.com, ysato@users.sourceforge.jp, david@redhat.com,
 thuth@redhat.com, iii@linux.ibm.com, mark.cave-ayland@ilande.co.uk,
 atar4qemu@gmail.com, kbastian@mail.uni-paderborn.de, jcmvbkbc@gmail.com,
 pbonzini@redhat.com, imammedo@redhat.com, shan.gavin@gmail.com
References: <20230907003553.1636896-1-gshan@redhat.com>
 <20230907003553.1636896-29-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230907003553.1636896-29-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 7/9/23 02:35, Gavin Shan wrote:
> Set mc->valid_cpu_types so that the user specified CPU type can be
> validated in machine_run_board_init(). We needn't to do the check
> by ourselves.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   hw/arm/virt.c | 21 +++------------------
>   1 file changed, 3 insertions(+), 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


