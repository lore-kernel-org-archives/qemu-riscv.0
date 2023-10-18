Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A31DCDB47E
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 06:33:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qt07B-0000Oa-RN; Wed, 18 Oct 2023 02:33:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qt07A-0000Ja-2w
 for qemu-riscv@nongnu.org; Wed, 18 Oct 2023 02:33:08 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qt077-0000ji-Qd
 for qemu-riscv@nongnu.org; Wed, 18 Oct 2023 02:33:07 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40839807e82so3648865e9.0
 for <qemu-riscv@nongnu.org>; Tue, 17 Oct 2023 23:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697610784; x=1698215584; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vIQa35M4vNuq7r8TCh/9iWXv3FeOcxQan7gdaZ0ndjQ=;
 b=HSw2Vw/SLXeSjtkq1JzTUCc1eiLW1AGpx+UQJ8hvSr/a9p8WX2O6oNkqCSCJ30atMj
 0eaTysP1xT8LWtvZtOIId4dftPnSWiWYWFM2z9sXlzFp1aze/Hs49Mz/x2OATHRJgbci
 OzBH/uWME5+u8dUolRC2NhSjssGmHw30j3OupbS5WlJ7npLktWHgfEy4f+lDpGPtqkN1
 265mu/uRrOt1ptlF2ODa/wb8TsrFoh8Kur1i7/CIAdTTMrG/0E9gcpJxC88c6utf4mb6
 zlxerDlP5txOZVZz4MJ9fOb8kjVEKUYbbDqZOn1Cbw4sFpBCgjDpq+l4eyVTS2LgqlbO
 AC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697610784; x=1698215584;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vIQa35M4vNuq7r8TCh/9iWXv3FeOcxQan7gdaZ0ndjQ=;
 b=io8imLWkTJEnVENrC8Bq2gz7k5ZNVchGHvxZJev8JZ1QMWcCg3qyDcV9lnGz1R56mP
 A46y0175MOiUUgjc+GqGz4bpXlzrECoy6uXd5m4sHcOnn3MZkSdodeYMkxXOkzzpu+eV
 +pG8oanE8zyeEg4l37WdhU0xCS81gg9R/bjSBPQFodqjKdR8J0IrwAmUuzEo/FNdTXqG
 l9P8aY3WcdAB+UuZIrMtodAlwdTqZwUTgz3BGiSJpSd+1KC1LiU4xOnpXHAoCUzxHQ8/
 3CLV7uEtDDCs2Szci25vodfMGV8pR525ehfVrniAnjn6Ip7t8Ml3wLU7M9PDfhujcqMS
 nGIQ==
X-Gm-Message-State: AOJu0Yxz3RBY0RDyoGW/v/QhqvE+H4uh7RDifpwt+dLDPiJ0lsn+ANws
 SVJJ4RSnEhDXZ7vDJW2Z0+wInA==
X-Google-Smtp-Source: AGHT+IGRyiCQapq4fS9KmFugKCJFJ5QT77XXEsx1JVrVAmsitt+96+HdIcl38+5glm/8cUimHHP68g==
X-Received: by 2002:a05:600c:3d14:b0:405:2d29:1648 with SMTP id
 bh20-20020a05600c3d1400b004052d291648mr3724373wmb.19.1697610783872; 
 Tue, 17 Oct 2023 23:33:03 -0700 (PDT)
Received: from [192.168.69.115] ([176.172.118.33])
 by smtp.gmail.com with ESMTPSA id
 fc8-20020a05600c524800b0040535648639sm785401wmb.36.2023.10.17.23.33.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Oct 2023 23:33:03 -0700 (PDT)
Message-ID: <4a34d96b-7eb7-d04e-e602-77a1d8ae8a7e@linaro.org>
Date: Wed, 18 Oct 2023 08:33:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH] MAINTAINERS: Add unvalued folders in tests/tcg/ to the
 right sections
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Artyom Tarasenko <atar4qemu@gmail.com>
References: <20231018062401.20746-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231018062401.20746-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
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

On 18/10/23 08:24, Thomas Huth wrote:
> Some subfolders in tests/tcg/ are already listed in the MAINTAINERS
> file, some others aren't listed yet. Add the missing ones now to the
> MAINTAINERS file, too, to make sure that get_maintainers.pl reports
> the correct maintainer.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   MAINTAINERS | 6 ++++++
>   1 file changed, 6 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


