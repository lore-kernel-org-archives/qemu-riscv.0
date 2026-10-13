Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 392CBCA9ED2
	for <qemu-riscv@archiver.kernel.org>; Tue, 13 Oct 2026 12:10:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xGbKm-0006bK-TO; Tue, 13 Oct 2026 08:10:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jaminlin1207@gmail.com>)
 id 1xGWU6-0001K6-5r
 for qemu-riscv@nongnu.org; Tue, 13 Oct 2026 02:59:38 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jaminlin1207@gmail.com>)
 id 1xGWU4-0005x2-98
 for qemu-riscv@nongnu.org; Tue, 13 Oct 2026 02:59:37 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-c3762b0d45aso14271466b.3
 for <qemu-riscv@nongnu.org>; Mon, 12 Oct 2026 23:59:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791874774; cv=none;
 d=google.com; s=arc-20260327;
 b=bM4kiSkv0YRfgELcIMLBjVExUSa8SvO7hy+Cw0YiCYca7x3Ibj30nPAjL9i3cD9iZo
 AgaahHoRzhChWOYIbD1MYKf13eLE/rXaT42r14FF8j1F3Y1gpEcNxsS53sjG+qet+O2Z
 jkUS1ghs1JLEuoT1pUz3WgjCYJJgZAq5lAOw59IszpOiB2mEOwn5YRVr588FM0dFXNDn
 U0rgqUwhDS/m8B1meTcoJr4ISGkuhqE09ndBmZSdHbJlEtMJaHj6+Dk6lJGuIey7zbV3
 1kUKkzyeTGus0nYEiMP0+KBechVQFN7Yx8nkLTckBoG7I5VdOnOw/P04mEoJKLKP+gUI
 tjpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=FsavGuJI7lEm09dh/9TGEx9R8ziC15kKprEg0eqdWvU=;
 fh=HiHGptnCPwqBV2X1uhDu0Q3GA5hbaU7KQ739una7er0=;
 b=mBKb3/+GeFM1LdWJZFm6EnI8t7kSYHzYmI9044FcHS62QGE4m+TQh1nO1fsqvy9Ydg
 RYLtZPGLfliy3rEQg61FZpQQNfVYhdZTfb8MjO8cj67ud6D4nxohBgn2Ny62VFdkc7g/
 kh8JlU+0UKN62JRxhAulKFsr2ajGI5YVvia2mK6pb81jFiyOho4ev33SAGMi3LYI/dxE
 IWvFkynjLKXN7c9TQfsp7S69mWAgcgqHl4d2A4HCXpmHV2wCTu3fixgGYpO+dh/BsW5W
 zP4ndCGVeBvW4PJPUw4jvL930+/Lnq4g6yhNuDvYlz/IUKrZQ7JoBclR//uGY1AEjISu
 GSoA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791874774; x=1792479574; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=FsavGuJI7lEm09dh/9TGEx9R8ziC15kKprEg0eqdWvU=;
 b=I1HEwjMlLR86XGkPd3gKD38S36h86gJ3rwrqZWoJpt2BsH8DHKcxkiidOr6lvVWUdf
 EEVp1fra0sf+xtvqVshdwT++YcK96NGHanNbFtjsyUArrWYcoCOPYWeof8ZQucf4KxFo
 OxCsUGchzZOVornCOXi8Aakoej3mXKvLHmSBNP/bAuvKy2Nx+5AqsenCMUqKfmCjusPt
 Q1Ggrl2aEZqmH11rHWx24plnF8r7RHvk68uGi6bqYf7bzq02BAUviiof6w5Dz0gbAoOJ
 HZu4nFmh4WYL2+L11IJL6Tp2JwlAPgiVRdqQMXvbHlC1/d4V68hBn/ytGUPrftCzG7FC
 gzNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791874774; x=1792479574;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=FsavGuJI7lEm09dh/9TGEx9R8ziC15kKprEg0eqdWvU=;
 b=t8ba61ls+U6l4HQdP2mVcR0c4/B3XbgCfuES7Ms/biXowoiIvcpCLAmngFL1AOmcPn
 vftEFt5uO2kYGyOCGzXiPnDzQOTaGbw6OKnCqvOuswGEg7YZ6qPj8QlEjlNpvOFB5UtH
 d+hwgWAX9BkihoGtda9UdPOJVbz4VTDLw6xBoHU5cW146T0qd9/UrlaBllQUpzmcTSYf
 qZoykrpa95aBXousMYnM1Y9cC0Jl4m00g9w897hlOAu/N93V5tKhowixNZ1eac+mGc5Y
 +06tt/mSGfNkNpUw5PntKVuHSDPsJcJiYAXNILiQz0p7ynECN8RS7LsRqPdOxEO+/Eey
 TG6Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBwy895wPoW1s64tUbjqsIK7Bq/Ar+F+2MqmAu45zmGOoLoloibvSXtgGUHT26BL5+wZmn3tMqBi3xoI@nongnu.org
X-Gm-Message-State: AFq9FYLq8TkjEif1okERXs7ISTg/EtG7VJ38rsAIlOwseczbQc/XWMqE
 b/7klS/900r0vkuQSdC4RILYZE8vAvl8NKVrewasu9Ji5EHPs6zC2pOBJ2KAjHBARdU2N7CENIo
 9VpN7HFczh65Yp2pu0S7xX1VOZvDTIx0=
X-Gm-Gg: AYBFou08nLByMcNdLaTWfr7DKCPpIBEwUtBJ4F4ZTCgMWaW6bkUn5u6sE6JdHky5Q5u
 /bYNcf6AZKr1/QRqo5OiSP0FL9eHiDfLa9C2cAJban5d1Jnq9O+nneJyBVjIr298m1EVi7s/doy
 ssFPTupdBOJEFEd9XROT9tNfkogdy84Y2C9mhqM9LWdK3oJ/98WZwmBgYx976G5nj67m+gDpHwG
 +Lps6KMdjBEYUdv8DT1zAQzfpaqhzmdc+hIy24zhibBFL39P7VuB8R73OgWwNsmc4mX8sKtPIBM
 oSZpXjJzztbwyAWu0z8UxWArxk2liPoOqt3fjSiU5PMT5OQhz+ePTBjq
X-Received: by 2002:a17:907:6e8d:b0:c2d:c247:5400 with SMTP id
 a640c23a62f3a-c31aa036554mr1179168266b.27.1791874774515; Mon, 12 Oct 2026
 23:59:34 -0700 (PDT)
MIME-Version: 1.0
References: <20261012-bmc-minerva-v2-0-4c3dff084ec9@free.fr>
 <20261012-bmc-minerva-v2-2-4c3dff084ec9@free.fr>
In-Reply-To: <20261012-bmc-minerva-v2-2-4c3dff084ec9@free.fr>
From: =?UTF-8?B?5p6X5bu65piO?= <jaminlin1207@gmail.com>
Date: Tue, 13 Oct 2026 14:59:23 +0800
X-Gm-Features: AclHuK-Juu4jyCWFSBvsTqcpvyHmJJV5uRXR2I5GXQDuFjYa8LFy17LiuHfWeQk
Message-ID: <CA+8rw5xDogAem_bbfoYrS2JFLPc90DTngJ_vgvWgn1L0gtvJTg@mail.gmail.com>
Subject: Re: [PATCH v2 02/50] docs/system/arm/aspeed: add the sanmiguel-bmc
 machine
To: Emmanuel Blot <emmanuel.blot@free.fr>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, 
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, 
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org, 
 Patrick Leis <venture@google.com>, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=jaminlin1207@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 13 Oct 2026 08:10:03 -0400
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

Emmanuel Blot via qemu development <qemu-devel@nongnu.org>=EF=BC=9A
>
> The Facebook SanMiguel BMC machine is supported by hw/arm but has never
> been listed in the Aspeed documentation. Add it to the AST2600 machine
> table.
>
> Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
> ---
>  docs/system/arm/aspeed.rst | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
> index 933df41f96..f38f33cbe1 100644
> --- a/docs/system/arm/aspeed.rst
> +++ b/docs/system/arm/aspeed.rst
> @@ -34,6 +34,7 @@ AST2600 SoC based machines :
>  - ``bletchley-bmc``        Facebook Bletchley BMC
>  - ``fby35-bmc``            Facebook fby35 BMC
>  - ``catalina-bmc``         Facebook Catalina BMC
> +- ``sanmiguel-bmc``        Facebook SanMiguel BMC
>  - ``anacapa-bmc``          Facebook Anacapa BMC
>  - ``gb200nvl-bmc``         Nvidia GB200nvl BMC
>
>
> --
> 2.50.1
>
>

Reviewed-by: Jamin Lin <jaminlin1207@gmail.com>

