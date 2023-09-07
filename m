Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CBCEEE14D3
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 08:59:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qeAqO-00064S-53; Thu, 07 Sep 2023 04:58:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qeAqG-000633-Hd
 for qemu-riscv@nongnu.org; Thu, 07 Sep 2023 04:58:25 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qeAqC-0008GM-I3
 for qemu-riscv@nongnu.org; Thu, 07 Sep 2023 04:58:24 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-31c73c21113so680760f8f.1
 for <qemu-riscv@nongnu.org>; Thu, 07 Sep 2023 01:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694077099; x=1694681899; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hREobUNlWVPYzdlt0N94XWuJ37kHY6R7TO/8WXMn0Os=;
 b=Gc2BDcsDWjw/yRR54WFV51we1xAGrFeCYp1b6BEA8mMXJe/c59ESKPIfipz1+g60Bh
 2Yz/myBRaiOFYTznGKQlYhSWEnIoh8FYWM7lMRNnxogcBuX9NwZetww9wYM2/LDC9s16
 ci17klth/wygSnYg8G/rSuJwTRO9KHeRJ5Rd+5ju2zPcTrpGiVUzL/QrTE8EoE2u3Ekt
 XQPT8h1QXZy8eo3Mfc9KBRcjd1QX5AujPyyEFl3eaGxcJ/8NQUa5Gr8lklDBMX8BJYw4
 GeKP0KKu1kT3GF+/ayYuuqr/Fk/WZNlJAU74g0ZVkOGDjAUDP05iSw4RLUoALaH/H2w3
 LNQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694077099; x=1694681899;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hREobUNlWVPYzdlt0N94XWuJ37kHY6R7TO/8WXMn0Os=;
 b=SgN/bbfxtgD2eBUckwtn14NHHaSMqMu64GfClZe8DqZUd5sV9r+lnrSqix1R2R0j+a
 xjk6QWLHXc2KD2KckMMw9lEjKf68iiMkj8/0czw/ZLHzKL18Iw7Mh9UaFObuRQHUIrgq
 o27u4z7fVMIkw0Iw4OaHe9DBiBzFkdH4RdHAfEV4/pIeZbjht8caLb6w02rpWCcFWM15
 wq9+Rs3wGzcCyfgDyHWhk1OjYaMfVi2a59/+B50Yw55Lxr5xwctSG0nQzyGG4S1ygZ1r
 FyZPF0HipcFyH6VYBtgH9hg5ZRZpQwMi7Wf7TcXxG0YlMGIPJ3mqxduiMdSv174KVuGb
 ljYw==
X-Gm-Message-State: AOJu0YxzpxxIX+MvfCSy0AmodYMMEIHzoDfkGiimIdaE1WScuU2aHtiI
 8/1mr1wFb1gudtY69EmNdrHIfQ==
X-Google-Smtp-Source: AGHT+IFtvdKlme6Gp992ty7qCJJS7KEYzhtN/gxFYDEp4DoXgdL2RayW9D9sUpKRNxye2Aeb+OwBSw==
X-Received: by 2002:adf:fd0a:0:b0:317:650e:9030 with SMTP id
 e10-20020adffd0a000000b00317650e9030mr4496356wrr.57.1694077098822; 
 Thu, 07 Sep 2023 01:58:18 -0700 (PDT)
Received: from [192.168.69.115] (176-131-222-226.abo.bbox.fr.
 [176.131.222.226]) by smtp.gmail.com with ESMTPSA id
 r5-20020adfe685000000b003143867d2ebsm22749786wrm.63.2023.09.07.01.58.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Sep 2023 01:58:18 -0700 (PDT)
Message-ID: <072f8179-01f7-5575-9a68-88a2bbffdc3d@linaro.org>
Date: Thu, 7 Sep 2023 10:58:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v3 24/32] machine: Constify
 MachineClass::valid_cpu_types[i]
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
 <20230907003553.1636896-25-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230907003553.1636896-25-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> Constify MachineClass::valid_cpu_types[i], as suggested by Richard
> Henderson.
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   hw/m68k/q800.c      | 2 +-
>   include/hw/boards.h | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


