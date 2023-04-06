Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkLS4-0001d7-M4
	for mharc-qemu-riscv@gnu.org; Thu, 06 Apr 2023 04:58:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pkLS3-0001bi-7s
 for qemu-riscv@nongnu.org; Thu, 06 Apr 2023 04:58:39 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pkLS1-0004py-Cb
 for qemu-riscv@nongnu.org; Thu, 06 Apr 2023 04:58:38 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 v6-20020a05600c470600b003f034269c96so13119239wmo.4
 for <qemu-riscv@nongnu.org>; Thu, 06 Apr 2023 01:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680771515;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hHzSA/w+tX29wdWiyiod4QQFWJP9A2SW72Qr9AlU6gA=;
 b=CfPEMKLKqOz/c3+hZ29YAY4dhnm3/P8Qdd5ytuaG4hm36heD2Zf/Ekwv2bz3sieyAU
 lCS9A60SVmslx2d+mK0nvxajpqAbWWH58sSX50rXMYKxvlOJT8cQtIKonxVMWaQJgpr2
 z9ZCuQsrxcXpHJS4q4vmTB5xM1uqNH2aZXDpGq8XaLTUE+9L4Qj3x4aveWKuZTctKpoq
 f8HBIJM2csKrijwyNxnz2n8JvCN9mEFcSyULbkVvfCxdojQtvuuPHIcmvsnvIdlISU8C
 08sGcS1Kmk+2IN2DdDH14DbP5n3N0njIrvaDv8nFRT+8d50kImoO+gz6xnUFNzAelVyz
 NqLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680771515;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hHzSA/w+tX29wdWiyiod4QQFWJP9A2SW72Qr9AlU6gA=;
 b=YPG2dVlwsCgtVnT7DlmlTPsniK1oTN/kArm+vR9/8FUtvzEZAuZOoXDt2yOGmgSLyy
 VEdNYeqgyv5XFj2d4D+pSkiBQCJacIRtLe78BK0xrZEZ63VfZ1Q7caekGF5cTBZFaJVH
 01Z4NsMM65Vev4EVDgoSoK+Nu69MgIuUkR/iQrez+mJHUYagKvQbpfvWUaGz7R3hVOvD
 gOqWuB5z47Epjtb3+qZO3T0q9TVLIDkc7/9/PaVFQDdfVw162wDOYz038cnvrhQX5QKF
 MFiN/FvDp0RcK+4op7CYZIZaWmy3C//BMLUKsZeM9DxO9OQsDhM1/Gu3PsIeNkLeafjF
 EHZQ==
X-Gm-Message-State: AAQBX9fQALzP6TDinRCx6DG5eQ+CFv1sxw1uGIcqbMyOCSqwajCw+5Cd
 HvAKNxGu40iI3YJkvkPLfGFYvg==
X-Google-Smtp-Source: AKy350ZvO2HEFpt6fKATtkVuDR9PZfHcx1kRVj+R7uhiRUrRmPQtOUp51lr7nDaatafZ7WJbFafRmg==
X-Received: by 2002:a7b:c34d:0:b0:3f0:44d1:3ba7 with SMTP id
 l13-20020a7bc34d000000b003f044d13ba7mr3420294wmj.17.1680771515016; 
 Thu, 06 Apr 2023 01:58:35 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 i16-20020a05600c355000b003ede6540190sm4772378wmq.0.2023.04.06.01.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 01:58:34 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2B7231FFB7;
 Thu,  6 Apr 2023 09:58:34 +0100 (BST)
References: <20230405160454.97436-1-philmd@linaro.org>
 <20230405160454.97436-2-philmd@linaro.org>
User-agent: mu4e 1.10.0; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, kvm@vger.kernel.org, qemu-ppc@nongnu.org, Paolo
 Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 01/10] sysemu/kvm: Remove unused headers
Date: Thu, 06 Apr 2023 09:58:24 +0100
In-reply-to: <20230405160454.97436-2-philmd@linaro.org>
Message-ID: <87ile9jsjp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Thu, 06 Apr 2023 08:58:39 -0000


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> All types used are forward-declared in "qemu/typedefs.h".
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

