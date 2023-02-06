Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pOyi0-0005SN-Tb
	for mharc-qemu-riscv@gnu.org; Mon, 06 Feb 2023 05:26:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pOyi0-0005S4-6B; Mon, 06 Feb 2023 05:26:48 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pOyhy-0002L6-K4; Mon, 06 Feb 2023 05:26:47 -0500
Received: by mail-ej1-x62b.google.com with SMTP id hx15so32676149ejc.11;
 Mon, 06 Feb 2023 02:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mMuDshQ4BHUUGzKLcUc7fCITYJEM9uaMgWaz+MM72Qk=;
 b=b9FAj2ZCvOXIkva8mq01ncVd0H/sVkGWFuIcgrCmQMgazu9TsdfURfy3se3HZVC+4q
 43BY7cb6fqo3tA2r44L67ndI5/JMjeLoZdfq4fsHRkEVNPZNqecnMSfEugQS+ji8SRPM
 LpgQz+IcbBdumjzP2BVf62z5p2elSIhMS2TZXUi5BQatvhuspgXEXZimQleMHHHJRtem
 oGFfy4EiJidm6q5wrkaR0VaJ/tD4vRBjbZhTXMsNFIiXaD53GjnwoDnyi8uC8+k4V8Ao
 iiE0yfsLRGymGhrSxr0bVRpkZX7fN9hPjaWKIVzMzh89z5GR36Bvo0oGOu7oTTIryuCC
 m/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mMuDshQ4BHUUGzKLcUc7fCITYJEM9uaMgWaz+MM72Qk=;
 b=XhtbFx9bTPcdpdiRvYhNemiVcQGrkj/4j5ZSqmgavAO2K901MLpv6v6nX9TVqzM13L
 VZqMXPXQaasgKpjnTpl2N+DoVcFHO86F7ajp+z/d0+vzUeGarVAPWNQPlWmIjBdky5cz
 vPuTr4CrMJZIjMM9qnFWDeHrn2fZjmm1dDebEPKwFRZPolDfqyodgMp0Cg/2mxoCsf+e
 DWJllbZfPeE+21MTrw5TeiEIPX0z0C7dRLQydhYnLhIKg9+WIlFj72WRY5fMpPykW2bl
 HB0PfnjVL1ndc1OTvseshJz3ZOWO0aHET7xHdALQ6PGgHK56UsK6fppwvnnZJ6WV0XAs
 GA9Q==
X-Gm-Message-State: AO0yUKUz9LM0ELewzlhzY5rC4LWcpRUGIMVwTye6JS7+gbX2uQUNtG7Y
 kF0otfHa/eDhNayQwXh44U8rjIWZOkbzEofkgkE=
X-Google-Smtp-Source: AK7set/yngp5KgSnfKJYXJIJjaj55gYhLsz4CeFvWQWcfjjdmSjfR0SEMQCMArDTkdkCnCJTk0g7H19SIrnlAZ9sESQ=
X-Received: by 2002:a17:906:8395:b0:888:f761:87aa with SMTP id
 p21-20020a170906839500b00888f76187aamr6187259ejx.163.1675679204795; Mon, 06
 Feb 2023 02:26:44 -0800 (PST)
MIME-Version: 1.0
References: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
 <20230202045223.2594627-8-sunilvl@ventanamicro.com>
In-Reply-To: <20230202045223.2594627-8-sunilvl@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 6 Feb 2023 18:26:33 +0800
Message-ID: <CAEUhbmXQZQsH6wiQLf1dHQEVnQX4bgZeNAaVVgBNAo66nuZkfQ@mail.gmail.com>
Subject: Re: [PATCH 07/10] hw/riscv: meson.build: Build virt-acpi-build.c
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
 Atish Kumar Patra <atishp@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Mon, 06 Feb 2023 10:26:48 -0000

On Thu, Feb 2, 2023 at 12:53 PM Sunil V L <sunilvl@ventanamicro.com> wrote:
>
> ACPI functions are defined in new file virt-acpi-build.c. Enable
> it to be built as part of virt machine if CONFIG_ACPI is set.
>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  hw/riscv/meson.build | 1 +
>  1 file changed, 1 insertion(+)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

