Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE26EC2BBCA
	for <qemu-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 10:48:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sM3ir-0004cn-Hh; Tue, 25 Jun 2024 06:48:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sM3iq-0004cW-Jw
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2024 06:48:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sM3io-0005rN-SG
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2024 06:48:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719312501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9mQ99lHkIq3DfHEjy/RgutHBBcsK/k6F3d8XvkKQD8g=;
 b=FziLr/EQnPSIIW20j8tnG1cja7C34XY1jA6CtpLgL8NMvrMOwPTU5xjQdmsNsgwAmLdQGe
 OL9gQiV0hJacc7u+8s6OkZnW5E0UoKJ20bLoFiLDhVlZRW63wTNivn+93UJJHdtiTeKEcg
 yAu5U8e5uafSiRiQZx9BdpPGkNwr3Fc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-XPW4IFHwNIu9Du6oxezwUw-1; Tue, 25 Jun 2024 06:48:20 -0400
X-MC-Unique: XPW4IFHwNIu9Du6oxezwUw-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-363520c91b1so2563288f8f.0
 for <qemu-riscv@nongnu.org>; Tue, 25 Jun 2024 03:48:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719312499; x=1719917299;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9mQ99lHkIq3DfHEjy/RgutHBBcsK/k6F3d8XvkKQD8g=;
 b=O/i2IjV2AUMq3w6WQqnSQ6VTtJZU5B3Hgcej7Z0h+sqhSYac6FZu7DAe8CSEBwicWM
 zdCEsDt46vPDCZx2bbZw38/iktHvdZcm+RiU4x3tS28kBBMO0hS0a5lhjQgo0trML7J6
 gHQnXryO15VbNR6yzrubqtxfDKG/uzTD4UM2B7PdB82oHzw3e/El6YzmYS9AbynNr6V6
 z26jrjhWh3Fc6jNLvaIfbTw0tPbVdqI2XnVGOdrqjPgjagIGDmHqFVxVnjwQnJtUuvqq
 Z43/IzTS0h2Nrldse80MRZkQAlCcfCPTnpRMwl4urek0Gu7bpcQ24CMnkrflz7NxQ72h
 yGKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjHVoFoNjq+B5xya7VGN0GjORdvZeo7G/wZXvNnYaH8jh1MusxMW22NR0mrMDIqb2AxW7RZkJYgQVb3kySL0ztReWQrhU=
X-Gm-Message-State: AOJu0YxwYLJ9kpG2kWMWVyMFPYa4MQR6dLbMH6Tlpu4y9us2emYlQTvS
 t6YGILqbmYmBCw8gyQEpHMm0a5b+EOz692OvH+GGvpW87L/qzVsHOt3aarc6UKt8ypdRJWG0vRZ
 bO7/ojTpSGRk8MK6JVX3+saDM4KXMU6HwBs8K3vdlqlrC942w23O+
X-Received: by 2002:a5d:5f49:0:b0:366:f713:bf05 with SMTP id
 ffacd0b85a97d-366f713c0f0mr3926616f8f.64.1719312499126; 
 Tue, 25 Jun 2024 03:48:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3oVYc1iXsoi6BD1dJyg6HQ20OHs2Mbk4XLJF7QxD0EJHqKRfbgJgmH5zeQRUGx1/F2r+x+Q==
X-Received: by 2002:a5d:5f49:0:b0:366:f713:bf05 with SMTP id
 ffacd0b85a97d-366f713c0f0mr3926602f8f.64.1719312498653; 
 Tue, 25 Jun 2024 03:48:18 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36638d9c1d1sm12589567f8f.51.2024.06.25.03.48.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 03:48:18 -0700 (PDT)
Date: Tue, 25 Jun 2024 12:48:16 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, Paolo
 Bonzini <pbonzini@redhat.com>, =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau
 <marcandre.lureau@redhat.com>, "Daniel P . =?UTF-8?B?QmVycmFuZ8Op?="
 <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>, Philippe
 =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, "Michael S . Tsirkin"
 <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Sia Jee Heng
 <jeeheng.sia@starfivetech.com>, Alistair Francis <alistair23@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: Re: [PATCH v3 05/15] tests/qtest/bios-tables-test.c: Add support
 for arch in path
Message-ID: <20240625124816.48183def@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240621115906.1049832-6-sunilvl@ventanamicro.com>
References: <20240621115906.1049832-1-sunilvl@ventanamicro.com>
 <20240621115906.1049832-6-sunilvl@ventanamicro.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.151,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, 21 Jun 2024 17:28:56 +0530
Sunil V L <sunilvl@ventanamicro.com> wrote:

> Since machine name can be common for multiple architectures (ex: virt),
> add "arch" in the path to search for expected AML files. Since the AML
> files are still under old path, add support for searching with and
> without arch in the path.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  tests/qtest/bios-tables-test.c | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index c4a4d1c7bf..29c52952f4 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -78,6 +78,7 @@
>  typedef struct {
>      bool tcg_only;
>      const char *machine;
> +    const char *arch;
>      const char *machine_param;
>      const char *variant;
>      const char *uefi_fl1;
> @@ -262,8 +263,19 @@ static void dump_aml_files(test_data *data, bool rebuild)
>          g_assert(exp_sdt->aml);
>  
>          if (rebuild) {
> -            aml_file = g_strdup_printf("%s/%s/%.4s%s", data_dir, data->machine,
> +            aml_file = g_strdup_printf("%s/%s/%s/%.4s%s", data_dir,
> +                                       data->arch, data->machine,
>                                         sdt->aml, ext);
> +
> +            /*
> +             * To keep test cases not failing before the DATA files are moved to
> +             * ${arch}/${machine} folder, add this check as well.
> +             */
> +            if (!g_file_test(aml_file, G_FILE_TEST_EXISTS)) {
> +                aml_file = g_strdup_printf("%s/%s/%.4s%s", data_dir,
> +                                           data->machine, sdt->aml, ext);
> +            }
> +
>              if (!g_file_test(aml_file, G_FILE_TEST_EXISTS) &&
>                  sdt->aml_len == exp_sdt->aml_len &&
>                  !memcmp(sdt->aml, exp_sdt->aml, sdt->aml_len)) {
> @@ -398,8 +410,13 @@ static GArray *load_expected_aml(test_data *data)
>          memset(&exp_sdt, 0, sizeof(exp_sdt));
>  
>  try_again:
> -        aml_file = g_strdup_printf("%s/%s/%.4s%s", data_dir, data->machine,
> -                                   sdt->aml, ext);
> +        aml_file = g_strdup_printf("%s/%s/%s/%.4s%s", data_dir, data->arch,
> +                                   data->machine, sdt->aml, ext);
> +        if (!g_file_test(aml_file, G_FILE_TEST_EXISTS)) {
> +            aml_file = g_strdup_printf("%s/%s/%.4s%s", data_dir, data->machine,
> +                                       sdt->aml, ext);
> +        }
> +
>          if (verbosity_level >= 2) {
>              fprintf(stderr, "Looking for expected file '%s'\n", aml_file);
>          }


