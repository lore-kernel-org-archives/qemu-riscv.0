Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A685FC47077
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 23:14:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rO4FB-0001zG-NA; Thu, 11 Jan 2024 18:13:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rO4F9-0001xs-8w; Thu, 11 Jan 2024 18:13:47 -0500
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rO4F7-0007Zl-Mz; Thu, 11 Jan 2024 18:13:47 -0500
Received: by mail-ua1-x92f.google.com with SMTP id
 a1e0cc1a2514c-7cbdd011627so1880031241.3; 
 Thu, 11 Jan 2024 15:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705014823; x=1705619623; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mvWDCfXb9K6sOUvNI3RIbJoxe5RMzVTxoEo1l07iz00=;
 b=RucUpIuJSEX3zXd4HXmqu1JlkQ9+qtLv9xGWXhNSVrVjHpJ0o0CoUV4N0o5ChJRovn
 UxV2MGPB7sg7Y6WirRYNCvHQXlI+qJqlgNzoMp2sPGag5f6YQau7Pwucb0giowhfqnyY
 mSzh1g4iFedJqPd9USK/Z81ZUGtKosM4bLWgDqo1kRx5LGeSpYTwAbkGH9UtFal7VScn
 uMHPLM0iNNQx03/J7K29dwUbiK4K6H8V4Nre9m+/8szgOq8T/B39ep/ft8tJIgPyBDb7
 Wg8BVQrRKW7pSbQODUtmqRRFZA+rZpoG2R7mGBAP+3jqiaczVI76aKMCf+HWyoDb4mvY
 ghjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705014823; x=1705619623;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mvWDCfXb9K6sOUvNI3RIbJoxe5RMzVTxoEo1l07iz00=;
 b=rOg8A0/X+M9VB5rWqM9fQ4VJeI2tBNx0aZq3TBpEiybgSEYjHIxyzHyOebbTxVqHF7
 L/BmdMicbcd7WnT58VOCg5Voaiy5hklAzSxnVUfx7tEA3//rqyP29k+OBkG+VhWhCVVH
 ATXn+I6s0QvkORbO7NX/SQcxaHDZ9EcE/EFWSwi16JrBYDv3FLn2UbVdpga6Rnr7Y3sC
 u7Yv1DLB1f0Bbd9ViZAr2F5TqppVdIUqypRjOmFkCs/zaYcE+wfCSVvX21WACuC1HR3n
 V2t+1jYgsFis7W/PIhNwafB/METnQAulF0BKh3hkqvQgRmIwy4LwwAaMlt4CI3I/OvoX
 PBjw==
X-Gm-Message-State: AOJu0Yxs4l3F3y0qRxbIhwXggquzLF9Gu+QTuAhSZlQNi12v7eNSaBEV
 +SwXSGEMl4qQo0S1WlwNxMYZnrPJNF6ogL50Qr0=
X-Google-Smtp-Source: AGHT+IFuMNejdqpY789xEcsTxwd00raHU6aUbNO6iKwzZiaX1aUS1yBuP25RnIorAIQ+BZ/Pnh+UUo+R0gRvqCiU3Q8=
X-Received: by 2002:a05:6102:1914:b0:467:d72e:5054 with SMTP id
 jk20-20020a056102191400b00467d72e5054mr604011vsb.4.1705014823473; Thu, 11 Jan
 2024 15:13:43 -0800 (PST)
MIME-Version: 1.0
References: <20240111120221.35072-1-philmd@linaro.org>
 <20240111120221.35072-2-philmd@linaro.org>
In-Reply-To: <20240111120221.35072-2-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 12 Jan 2024 09:13:17 +1000
Message-ID: <CAKmqyKNZm8zUTnsBZ8Qi5gQeE9GL0Rr-KmpJHEZWQP8Bho6EgA@mail.gmail.com>
Subject: Re: [PATCH 1/5] accel: Rename accel_init_ops_interfaces() to include
 'system'
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Weiwei Li <liwei1518@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-s390x@nongnu.org, 
 Michael Tokarev <mjt@tls.msk.ru>, David Hildenbrand <david@redhat.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-trivial@nongnu.org, 
 Halil Pasic <pasic@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Ilya Leoshkevich <iii@linux.ibm.com>, Eduardo Habkost <eduardo@habkost.net>, 
 Laurent Vivier <laurent@vivier.eu>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Eric Farman <farman@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92f;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Thu, Jan 11, 2024 at 10:05=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> accel_init_ops_interfaces() is system specific, so
> rename it as accel_system_init_ops_interfaces() to
> ease navigating the code.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  accel/accel-system.h | 2 +-
>  accel/accel-system.c | 2 +-
>  accel/accel-target.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/accel/accel-system.h b/accel/accel-system.h
> index d41c62f21b..2d37c73c97 100644
> --- a/accel/accel-system.h
> +++ b/accel/accel-system.h
> @@ -10,6 +10,6 @@
>  #ifndef ACCEL_SYSTEM_H
>  #define ACCEL_SYSTEM_H
>
> -void accel_init_ops_interfaces(AccelClass *ac);
> +void accel_system_init_ops_interfaces(AccelClass *ac);
>
>  #endif /* ACCEL_SYSTEM_H */
> diff --git a/accel/accel-system.c b/accel/accel-system.c
> index fa8f43757c..f6c947dd82 100644
> --- a/accel/accel-system.c
> +++ b/accel/accel-system.c
> @@ -62,7 +62,7 @@ void accel_setup_post(MachineState *ms)
>  }
>
>  /* initialize the arch-independent accel operation interfaces */
> -void accel_init_ops_interfaces(AccelClass *ac)
> +void accel_system_init_ops_interfaces(AccelClass *ac)
>  {
>      const char *ac_name;
>      char *ops_name;
> diff --git a/accel/accel-target.c b/accel/accel-target.c
> index 7e3cbde5df..08626c00c2 100644
> --- a/accel/accel-target.c
> +++ b/accel/accel-target.c
> @@ -104,7 +104,7 @@ static void accel_init_cpu_interfaces(AccelClass *ac)
>  void accel_init_interfaces(AccelClass *ac)
>  {
>  #ifndef CONFIG_USER_ONLY
> -    accel_init_ops_interfaces(ac);
> +    accel_system_init_ops_interfaces(ac);
>  #endif /* !CONFIG_USER_ONLY */
>
>      accel_init_cpu_interfaces(ac);
> --
> 2.41.0
>
>

