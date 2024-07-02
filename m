Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC76C30658
	for <qemu-riscv@archiver.kernel.org>; Tue,  2 Jul 2024 08:30:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sOYtz-0002YN-MH; Tue, 02 Jul 2024 04:30:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sOYtx-0002Xw-Ty
 for qemu-riscv@nongnu.org; Tue, 02 Jul 2024 04:30:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sOYtw-0006ix-EB
 for qemu-riscv@nongnu.org; Tue, 02 Jul 2024 04:30:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719909011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kC0cPw9y45v679oJEtioTuaLvA8Xl1ijXhsCgPNIk58=;
 b=ceLFk/UJweDa6XZB6z0j4GfAKX3AVcLl7dAWc9BW/wdSEpwCddFBhN7hZgQ6G4/vlOU3I+
 p7neAq9G8BZ9+KfNAYt+jTNtWwuh3Q/Cvq5HLzHo5RMmklrleONHlYT/e26N1xc0iPNKmL
 Y+rblNHjetwvt91cLV9j9oIVWR5c8II=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-303-p-kP6h1-MxCVb0UAjCvmjg-1; Tue, 02 Jul 2024 04:30:07 -0400
X-MC-Unique: p-kP6h1-MxCVb0UAjCvmjg-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4258675a531so9639465e9.3
 for <qemu-riscv@nongnu.org>; Tue, 02 Jul 2024 01:30:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719909006; x=1720513806;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kC0cPw9y45v679oJEtioTuaLvA8Xl1ijXhsCgPNIk58=;
 b=KZhXhJUA6CaIcg0/eOA4sYVeq4n7DEZdZkL8D0jsAbClfpPTs5ou+49C7vxLDdp41z
 uQi+sADIuT5Y5AkLLOJJEvApc3peRorcWrfcVQ1ZXfTaimwlXRCA4kiCPqAXuScQF+6k
 A/4Im8V1GtFdxcuZGjDAYFT83Yhpm64Bv1wMPL1wRzmKmLSElXSF6dqtWIDf8iwRX6dB
 OsJoN6TVCz8iwe0tmE4CTOmAJKYzUSlA6VLF8P4g33k8lDK3ajhKN5p0asg5KyT6cNzm
 2Kf1lNc/EGwsKtYEOFNVm8enlc7hLLyZlZDcVRHkR8H/ZhGEu+wyJeQr3UfMbHa1rDty
 UYEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCULapu/LPS5k8zmXO0ZkpMrgbrCwmM66Ia7hmrsuB7BuQwCL46dwb3KTulqBZV4mOaLlDMWf34DpcUQ+DoaZgx+N+MvB1g=
X-Gm-Message-State: AOJu0Yyx2/eMfcNk48ENVvu9Ggw0UQRau9P2f6EelZiKXxLhSpmY/6gx
 bQu8y+Jm5/DYKJHSXVnhTXvwV4Of7gUWktaCSseTbIpNCVnoJh1WyAlKbtRi+QZ9IlJgMHhU51P
 0+hjeLu15DCUVkGLzEyiJkpz+Im/bQvsfukKigGh0aDFYN+2+QDf/
X-Received: by 2002:a5d:4043:0:b0:367:4b78:20d1 with SMTP id
 ffacd0b85a97d-36775698c08mr4874679f8f.13.1719909005935; 
 Tue, 02 Jul 2024 01:30:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH03dIYy79QRpQMabTnQ/ThNgEOXT50w1++t6ut6m/aHr/OBSxixz3kkFS6S3ZRsfuadiCl5A==
X-Received: by 2002:a5d:4043:0:b0:367:4b78:20d1 with SMTP id
 ffacd0b85a97d-36775698c08mr4874656f8f.13.1719909005603; 
 Tue, 02 Jul 2024 01:30:05 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0fbbfesm12546857f8f.66.2024.07.02.01.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 01:30:05 -0700 (PDT)
Date: Tue, 2 Jul 2024 10:30:02 +0200
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
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Alistair
 Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH v4 06/16] tests/qtest/bios-tables-test.c: Add support
 for arch in path
Message-ID: <20240702103002.69a8678d@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240625150839.1358279-7-sunilvl@ventanamicro.com>
References: <20240625150839.1358279-1-sunilvl@ventanamicro.com>
 <20240625150839.1358279-7-sunilvl@ventanamicro.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Tue, 25 Jun 2024 20:38:29 +0530
Sunil V L <sunilvl@ventanamicro.com> wrote:

> Since machine name can be common for multiple architectures (ex: virt),
> add "arch" in the path to search for expected AML files. Since the AML
> files are still under old path, add support for searching with and
> without arch in the path.

we probably should remove fallback path lookup after series is merged.
it' fine to do it as a follow up patch.

> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>


