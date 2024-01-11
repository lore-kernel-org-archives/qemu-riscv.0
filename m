Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF7EC47077
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 13:31:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rNv9M-0004DA-Qd; Thu, 11 Jan 2024 08:31:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rNv9F-00049P-0a
 for qemu-riscv@nongnu.org; Thu, 11 Jan 2024 08:31:07 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rNv9C-00020t-IL
 for qemu-riscv@nongnu.org; Thu, 11 Jan 2024 08:31:04 -0500
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a2c29418ad5so128167666b.0
 for <qemu-riscv@nongnu.org>; Thu, 11 Jan 2024 05:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704979861; x=1705584661; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ApFCZe++K6mdEosZ5Zb18U8fI6FgBHYQCdfmSUN0e0A=;
 b=a7IOfG9UuaOG3lnH0t/JGdH03kHjfmGVkpcPLFisNPjzLL+YZ1SxGjK1fDE67Qy/XR
 l9+G64raVAOd5ldHjCC+CURUqEjz/pEiQKER31AcQ02O/9dUCP7sQUF6A7+4ht/qJtpL
 K4P7pwwFtLDdC67TsV4toqNOEv5Xq1ShAfkLL2HpuHSxrvG6OfKT8wJFAcpY2gbYoBWb
 etaFl9RykOeG5omueCBbTPSdO+FuXKP7W73Ypvrf2DRhsOOHXW4BEICRHgHczFbMwj5N
 Ppa3U9c9P7rRP3iR/r2smzfphP5f6DAbXOoE8qZXQEaWJdlKES0UOWM0juXmNxTaeRvF
 FuEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704979861; x=1705584661;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ApFCZe++K6mdEosZ5Zb18U8fI6FgBHYQCdfmSUN0e0A=;
 b=onjMVquFfi6dKts/6qz0bgeQ/BNRi+s5ovMI4ePkz1e75a4t/LxgeQsoneEZfhrqdh
 0Sca/XNsYYD6fP5a1hgVLAPYdqB/xxx/o4hXcvI+pTQx4Ju0JCy8dJB8z7/zWuZjjAWT
 z1V2nWp7MaO1yaXbmpLSBOJEmj5aBZWydhFQNgBqMRCmrx/qb/lmFIJG9tXcF4IPHccR
 g2icMWx2b2VsU1oSbYfiy/8s62JBxdwaIF9KVqcTp5tPTy2nZu6aDUG5798kV049Rowy
 iCm4gt3yZXEB7nphoOtx61xdmUXNuAtuCvN/aEF0iV6fgA7kHHImqaI7NLecb517IsH2
 U3SA==
X-Gm-Message-State: AOJu0Yx9B4FXBdUKTD2IFtOhbwn+ZsAC12vbBYjjhhwymmdNkA9Fokzw
 97vI8gJCzb0lnLtu18dnwDDHQ2O5erei/A==
X-Google-Smtp-Source: AGHT+IGYBUsAOKsLaP5iAzdHj6bGoHc74gul6QIY/5Uc9BDjtowkPwGrU9YvGcitLnOVH9KFRdeKqw==
X-Received: by 2002:a17:907:8022:b0:a2c:7293:d724 with SMTP id
 ft34-20020a170907802200b00a2c7293d724mr275807ejc.44.1704979860745; 
 Thu, 11 Jan 2024 05:31:00 -0800 (PST)
Received: from [192.168.69.100] (vau06-h02-176-184-43-236.dsl.sta.abo.bbox.fr.
 [176.184.43.236]) by smtp.gmail.com with ESMTPSA id
 l10-20020a1709061c4a00b00a2b9bbd6d73sm572899ejg.214.2024.01.11.05.30.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jan 2024 05:31:00 -0800 (PST)
Message-ID: <f8cd806a-4e87-4e19-b898-acd675f9daa6@linaro.org>
Date: Thu, 11 Jan 2024 14:30:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/43] tests/avocado: use snapshot=on in kvm_xen_guest
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Yanan Wang <wangyanan55@huawei.com>, Bin Meng <bin.meng@windriver.com>,
 Laurent Vivier <lvivier@redhat.com>, Michael Rolnik <mrolnik@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, David Woodhouse <dwmw2@infradead.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Brian Cain <bcain@quicinc.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Beraldo Leal <bleal@redhat.com>, Paul Durrant <paul@xen.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Cleber Rosa <crosa@redhat.com>,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, John Snow <jsnow@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>
References: <20240103173349.398526-1-alex.bennee@linaro.org>
 <20240103173349.398526-3-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240103173349.398526-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On 3/1/24 18:33, Alex Bennée wrote:
> This ensures the rootfs is never permanently changed as we don't need
> persistence between tests anyway.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/avocado/kvm_xen_guest.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


