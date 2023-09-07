Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A05EE14D3
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 09:07:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qeAzK-0006Gm-NU; Thu, 07 Sep 2023 05:07:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qeAzH-0006GB-Q3
 for qemu-riscv@nongnu.org; Thu, 07 Sep 2023 05:07:44 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qeAzE-0002cj-1D
 for qemu-riscv@nongnu.org; Thu, 07 Sep 2023 05:07:42 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-401c90ed2ecso8192535e9.0
 for <qemu-riscv@nongnu.org>; Thu, 07 Sep 2023 02:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694077653; x=1694682453; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e+0LeLWheEZo2jx/tfksWwMPjBz6FAD9QINK4UCiU0s=;
 b=zp6QgQaBHXOtXQvCv1vaY9xh/fIPXqPGoHZfhlsuSwQ3q5x0hTN17t8vk4usxh97Ik
 kInnUkLXA+s/lxwgxi5w1aoi+2AON9O48upTFPKjBJ4P6SGd0SgwHR0QxY6YNa00CXHp
 TUzY0mZ/VmeCaY5hnm0cP+eB8vcOYn4PGKGSncQ+w57gvf9DpBdPgxrn2jTKuwRcLzMs
 sHc4S0GfhsPhorL19uWlgv6vPWHMTYif8tG86ABue2nZRrauLywFXVbM0HrX5dzTxA5n
 H47QGAV26wnj5qLUWo6+obmKbbDf3b4+J8hj5MTMmJsKRsAZBfJUncIRvZr5mxHqkpvE
 17BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694077653; x=1694682453;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e+0LeLWheEZo2jx/tfksWwMPjBz6FAD9QINK4UCiU0s=;
 b=dfhEVirziR0alHIpmkQ1yOUwm6BoJhP16fKYizlUDHXIFYeRxvi1eMFT7cSAwccxYo
 KZbeitoV2r3CTyEMqre2e/jTN4BOA2WrSWhlm/A9b81htwq71KqyZCN+/VkFh2uubbWU
 ELrPgZoIB4P6muE3xXe9DYVSzfFJrvxld0cYejj0fWb8v1vt/bwDuVcN2RlkO/x0MAZI
 S6EsBKy4oHwdFhJnaCx7+Uegm/WyKOGToC7kU3Twmlu0z0Y/NmFiEY7AGVWLlBKIxMcH
 8NZitTjcPHCqs2+MbRyjEu8MVbbCVepItJlrwC26TGC8+p8BjmWeOy1mbAvagfK/BqYg
 zCKw==
X-Gm-Message-State: AOJu0YwStg8IwZGzoaT7QMBihlbWaQIQjmnGW5nxBAqRUHUaOKWSyCX2
 AWyAIUysT6cQVuwutNt+A+Zq46glp1ggjTuM8aw=
X-Google-Smtp-Source: AGHT+IGyxgw0EZYuHgZyu6Ifx7lIrPV8Awh6kT+c5irEiqwp03f+XVTOM/12OQ4qqtDOa5qLoCIwIw==
X-Received: by 2002:a7b:c7c7:0:b0:402:cc9a:31a7 with SMTP id
 z7-20020a7bc7c7000000b00402cc9a31a7mr3997937wmk.19.1694077653219; 
 Thu, 07 Sep 2023 02:07:33 -0700 (PDT)
Received: from [192.168.69.115] (176-131-222-226.abo.bbox.fr.
 [176.131.222.226]) by smtp.gmail.com with ESMTPSA id
 p7-20020a05600c204700b003fed630f560sm1896685wmg.36.2023.09.07.02.07.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Sep 2023 02:07:32 -0700 (PDT)
Message-ID: <c74ace91-b1be-9a12-c428-a59fd4ffcf1a@linaro.org>
Date: Thu, 7 Sep 2023 11:07:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v3 32/32] hw/riscv/shakti_c: Check CPU type in
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
 <20230907003553.1636896-33-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230907003553.1636896-33-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
> Set mc->valid_cpu_types so that the user specified CPU type can
> be validated in machine_run_board_init(). We needn't to do it
> by ourselves.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   hw/riscv/shakti_c.c | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


