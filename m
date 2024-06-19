Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A66AFC2BA15
	for <qemu-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 09:43:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sJrqZ-0004kC-Co; Wed, 19 Jun 2024 05:43:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sJrqX-0004jT-4I
 for qemu-riscv@nongnu.org; Wed, 19 Jun 2024 05:43:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sJrqV-0008EO-Mu
 for qemu-riscv@nongnu.org; Wed, 19 Jun 2024 05:43:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718790195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zA5kjGZbxNjVDSYa5KXeNn72ukq9qyDurgG9G0ggYl4=;
 b=cJLItjwqVzbRQaixHzNmvVItj+7KwbYHgXnZhQExXY45jKOrIBdnJYBf6YjgvnskWedlWO
 rmWHgicN6ClrbUZVdPdF1RUkeArI4kwNuRY2cV7OoA1Sy0HFA7CtUbhIqjEFNbZJI08aQH
 Lffx4NAGH5MClHlQyX8UybGk8S7/uco=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-LH4EwoFZPbqta-l5j9BbJw-1; Wed, 19 Jun 2024 05:43:11 -0400
X-MC-Unique: LH4EwoFZPbqta-l5j9BbJw-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3625503233eso355546f8f.0
 for <qemu-riscv@nongnu.org>; Wed, 19 Jun 2024 02:43:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718790190; x=1719394990;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zA5kjGZbxNjVDSYa5KXeNn72ukq9qyDurgG9G0ggYl4=;
 b=r+EM5gPKbb43FRAUS9m9Q8q2zS0hbQAAnAkNqtp18Wg4PB7P/UDkJDCnubfrYN4gTA
 qxq6qTIGOwk2Hpz+t7LenPAwZiMP17j6rfvHAb8upp+GAS30I+RgZq9Z3UpVduEFyiPJ
 layDXpcwFosd3ROLPHe3IYptybaJkiCg6dvP3TUQukE1q3ABoCu4IlEhowJs5j8yZWIf
 SZZ0Bo9lzyeKs4CRvsXADfRuOewUkTnP8ul5rCa/kFolrBNt2WRCP41ILMiAJtAan1/H
 7YjcCgO5/nfXr4FC4Jqhc0e2ASdZrJlUKpTfjpRcfRFfEds90wiBez96HFo6mG1fTnrK
 uerw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEP5A0SYbBarHqhhMdSxIx/P3yLVXxHXq5agLJWyIiOGM1Ik0JKZP1JLMLGhFCJzibMIYRRv3DPIUIX4tg4rlrAoCe1Hs=
X-Gm-Message-State: AOJu0YyaWoLntVQ13pNgPSvBvSIYFxXODQp1xjctLT4FyvLYjzw4TDt8
 FeKc3kTz3AUFdYcLRHOTzi6rbbGMcGRsmwq7R/wr9bhnQNU0Ei23axabTcckiutG19wNUJ/fQkD
 JPoRo6b6cWyNk33YLdbqVqnobbGVDzWpSiRQptDleuzIhG+J3pNKL
X-Received: by 2002:a05:600c:1d1b:b0:424:7425:f8a0 with SMTP id
 5b1f17b1804b1-42474d34375mr22770775e9.15.1718790189990; 
 Wed, 19 Jun 2024 02:43:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFbTKkBJJue0oxvG+VGm66g65goFyUk2cE5/mwicQHWuiHWKN9xXu+ck8l1bl5E+Lo82CBPw==
X-Received: by 2002:a05:600c:1d1b:b0:424:7425:f8a0 with SMTP id
 5b1f17b1804b1-42474d34375mr22770405e9.15.1718790189574; 
 Wed, 19 Jun 2024 02:43:09 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4229447eaa5sm255168515e9.48.2024.06.19.02.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 02:43:09 -0700 (PDT)
Date: Wed, 19 Jun 2024 11:43:07 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, Paolo
 Bonzini <pbonzini@redhat.com>, =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau
 <marcandre.lureau@redhat.com>, "Daniel P . =?UTF-8?B?QmVycmFuZ8Op?="
 <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>, Philippe
 =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, "Michael S . Tsirkin"
 <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Alistair Francis
 <alistair23@gmail.com>, Sia Jee Heng <jeeheng.sia@starfivetech.com>, Haibo1
 Xu <haibo1.xu@intel.com>, Anup Patel <apatel@ventanamicro.com>, Andrew
 Jones <ajones@ventanamicro.com>, Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>, Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>, Weiwei
 Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH v2 09/12] tests/data/acpi/rebuild-expected-aml.sh: Add
 RISC-V
Message-ID: <20240619114307.3f8c2f14@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240524061411.341599-10-sunilvl@ventanamicro.com>
References: <20240524061411.341599-1-sunilvl@ventanamicro.com>
 <20240524061411.341599-10-sunilvl@ventanamicro.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.148,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Fri, 24 May 2024 11:44:08 +0530
Sunil V L <sunilvl@ventanamicro.com> wrote:

> Update the list of supported architectures to include RISC-V.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  tests/data/acpi/rebuild-expected-aml.sh | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/data/acpi/rebuild-expected-aml.sh b/tests/data/acpi/rebuild-expected-aml.sh
> index dcf2e2f221..c1092fb8ba 100755
> --- a/tests/data/acpi/rebuild-expected-aml.sh
> +++ b/tests/data/acpi/rebuild-expected-aml.sh
> @@ -12,7 +12,7 @@
>  # This work is licensed under the terms of the GNU GPLv2.
>  # See the COPYING.LIB file in the top-level directory.
>  
> -qemu_arches="x86_64 aarch64"
> +qemu_arches="x86_64 aarch64 riscv64"
>  
>  if [ ! -e "tests/qtest/bios-tables-test" ]; then
>      echo "Test: bios-tables-test is required! Run make check before this script."
> @@ -36,7 +36,8 @@ fi
>  if [ -z "$qemu_bins" ]; then
>      echo "Only the following architectures are currently supported: $qemu_arches"
>      echo "None of these configured!"
> -    echo "To fix, run configure --target-list=x86_64-softmmu,aarch64-softmmu"
> +    echo "To fix, run configure \
> +         --target-list=x86_64-softmmu,aarch64-softmmu,riscv64-softmmu"
>      exit 1;
>  fi
>  


