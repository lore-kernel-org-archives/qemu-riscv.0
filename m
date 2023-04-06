Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkLT7-000381-EV
	for mharc-qemu-riscv@gnu.org; Thu, 06 Apr 2023 04:59:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pkLT5-000379-Ly
 for qemu-riscv@nongnu.org; Thu, 06 Apr 2023 04:59:43 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pkLT4-0004zt-7E
 for qemu-riscv@nongnu.org; Thu, 06 Apr 2023 04:59:43 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 n10-20020a05600c4f8a00b003ee93d2c914so24812328wmq.2
 for <qemu-riscv@nongnu.org>; Thu, 06 Apr 2023 01:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680771581;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5sRssPNnjk3FAAC+e6GI9oX98dvbrVIoKM4xtqCLlrA=;
 b=YII4xabBar2qgebAcPiklW/unkEMHWDuzLRCvxFk/UIH+PpgClheiQltRIEzpj77Pa
 E7NN+ACG3OIepEIJguzVWYGdlql7j7gya/NrJMMN2xMiJ4rHV6C4ykgh0KcgMUswajQF
 F0S8b5Gg/tq5SaNEEi6s16L142Z9mzJDOIPY3P0t3k1iH+VgJQ2Y1JXs5lWKp3Hzz2Wm
 yu1ioq8GHSxJHChSiUwRj5hZFWsTNj6lOH6K9PWeVBkLPCjaPaqs1Y+AhZflGsfkSnbN
 sKCN6wWH+p/G8uVtjuoNxP+Pc98XX49VuoY6NYEyhoXdAvUIPpGMSldLMRAFYdodaZyU
 5yVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680771581;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5sRssPNnjk3FAAC+e6GI9oX98dvbrVIoKM4xtqCLlrA=;
 b=02Ql9I+1yp1pBexkoIlcmSlrVfvAlBaGyc5rNF02R8P8LRk95Gi5QN68Kz67lWD43B
 iz9hBGWp8Byvkio6nqPWoQc3zRrMvjYrwD+Am37w182fFd1z8F0LKINuQ7j1wcmHGD8V
 8A4bIidJtS6wDpLgSIrz76SCSMGPV/KK3sZ/GfTfE3OVYXBH6fCRmcHJiK6KK27s08od
 0hYgYDhsIqjrTgxc817UEM7vnPZUUWXMbpKZ6bO3pStpSSaNXC6rIBu9QRywUGDpxsiw
 kR7pbGFhU8FvMNAvwOJ5E9x5re1yXDMxiAZUZJ/2qz8EJPyysa6AJQvBzKfsH7cqIP79
 b0pg==
X-Gm-Message-State: AAQBX9fFWCHiswr6pW6dfGCgG9JSqbdFy0OtjMIFD9dv4VzSeSrWwf4E
 foNUqQEKlzPAViZcsRvlvNC5+w==
X-Google-Smtp-Source: AKy350a5z9Vn/jqwCz8XAy+NdfPZbRY6wD5oyyp/lb/ETDZgLXHhcUAhKvVEQnxfzLFAT9HuflqkFw==
X-Received: by 2002:a7b:cb4d:0:b0:3f0:6b33:a5e1 with SMTP id
 v13-20020a7bcb4d000000b003f06b33a5e1mr862961wmj.9.1680771580873; 
 Thu, 06 Apr 2023 01:59:40 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a05600c474c00b003ef6f87118dsm4798573wmo.42.2023.04.06.01.59.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 01:59:40 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 32B481FFB7;
 Thu,  6 Apr 2023 09:59:40 +0100 (BST)
References: <20230405160454.97436-1-philmd@linaro.org>
 <20230405160454.97436-3-philmd@linaro.org>
User-agent: mu4e 1.10.0; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, kvm@vger.kernel.org, qemu-ppc@nongnu.org, Paolo
 Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 02/10] accel/kvm: Declare kvm_direct_msi_allowed in stubs
Date: Thu, 06 Apr 2023 09:59:23 +0100
In-reply-to: <20230405160454.97436-3-philmd@linaro.org>
Message-ID: <87edoxjshv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Thu, 06 Apr 2023 08:59:44 -0000


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Avoid when calling kvm_direct_msi_enabled() from
> arm_gicv3_its_common.c the next commit:
>
>   Undefined symbols for architecture arm64:
>     "_kvm_direct_msi_allowed", referenced from:
>         _its_class_name in hw_intc_arm_gicv3_its_common.c.o
>   ld: symbol(s) not found for architecture arm64
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

