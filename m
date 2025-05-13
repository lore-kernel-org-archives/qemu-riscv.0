Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 992F7C3ABC3
	for <qemu-riscv@archiver.kernel.org>; Tue, 13 May 2025 11:24:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uEnji-0003bG-49; Tue, 13 May 2025 07:23:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uEnjg-0003aF-Ns
 for qemu-riscv@nongnu.org; Tue, 13 May 2025 07:23:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uEnjd-0007cV-RE
 for qemu-riscv@nongnu.org; Tue, 13 May 2025 07:23:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747135423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XrH7sINLTStGfBHqPPfKqploDfxrQD6FVuxl9QrE70E=;
 b=Ll7pVrbgto79NmOe2FFDw+1dJ3wuvDsnayLnSrw2/zopJGA6tOd/WRto2aFWH5Eeg13Lhz
 vCDiAgrhpjrtgv9YbC3aIplQRkDPRu41xmJb84zeHlSyFArme8CPErTAYRyarHmSARWx+k
 YaqVLoefUcY8eJd8lOtGP3LfBSbbSGI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-213-OW04Dps5PGSvNLbaFY0RYQ-1; Tue, 13 May 2025 07:23:42 -0400
X-MC-Unique: OW04Dps5PGSvNLbaFY0RYQ-1
X-Mimecast-MFC-AGG-ID: OW04Dps5PGSvNLbaFY0RYQ_1747135421
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-442dc702850so19754395e9.1
 for <qemu-riscv@nongnu.org>; Tue, 13 May 2025 04:23:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747135421; x=1747740221;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XrH7sINLTStGfBHqPPfKqploDfxrQD6FVuxl9QrE70E=;
 b=i5CsoS4XdAMA0/oEtWaJUOLT1dfcEWGhQtQ4QFI6iCw0iuqUeZKhH7/ZReEM/JelOS
 1TwnsguqExH4+3WNQ5bWD+hM1WjpZyobE7hMj5FeLexFQqxXuUpdWzo5VdbFDew2cHje
 DXUNukseLt42NgOJ/0k87kP0xbE/x01KZzVDjrdZcjpB+txvoIgzFnbfFJgB5rxxlQj2
 GOGTsvxvfSQFSbxlni98JIrK4+HK/lxHB/x3UVOBKmhnak/Tedmry0xwWQELNa7p1gHS
 YafemK4vh0mOyWE3Rp59aeR7Gim+F6lFQ5h7N5FiXZLzY7Vk5cMJbiA/qdq38qqIi6WR
 2/og==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRiRNWq3URIVW4yEpQ1vXUIkzyU4hXnxk8yDCAW2ji18O6l31BEtlh0jruQYJBFeZpdl943v6VNThz@nongnu.org
X-Gm-Message-State: AOJu0Yy/nPe8+TTUzeIs3WoDk8TEqt9ZJh2Ct5tn3iWQh3HidIMxb/ry
 iq0ZfRviHXQN2HH6flAzkRMxWs4IDHSBjyHUDBTrABsDNFma/X8cowBNLc9LD60oC29Dlxq0NjT
 wInJwLKm8OSd129bNRUB9WznMHW0uDP/9RyFgqx2oEvn46fvdmz38
X-Gm-Gg: ASbGncupSh/jQcoA/mwkZ0yeW40yUeUT358iUnmIWmWSSe36DarRZYyhGJBCNiy5+U/
 W1Jwth1cAnCdbeWs6hdOrCqMvWHyD9o3+vQApVemye3kg3nH/nGHFbpdOR/U2QOoUFy/+O8fqfD
 mXcCe3Lh3L16hsQqfknnP9iKvuaE8E3NEeoCcL+YzAFSxBh8Cl92br/GdgxY1h3lJ1Qv/hKkuXD
 KpKWbqe52eFHqAmx+bCO2I1t9VI8BR3ygG4bGq2/SHshn7n8ZrpMKx5qJRmY43G3SXXYEQ2RzWs
 4+LeaFmoixWTlOplt5TJ4efsLiQFxokk
X-Received: by 2002:a05:600c:1e18:b0:43c:fe15:41cb with SMTP id
 5b1f17b1804b1-442dc95a564mr126025825e9.15.1747135421375; 
 Tue, 13 May 2025 04:23:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiMGzpOP7kEMnYGvVM8p+Koxg205GYZRanapDy3HAulIVBobUs+iamSuLianwcYnNelki2hg==
X-Received: by 2002:a05:600c:1e18:b0:43c:fe15:41cb with SMTP id
 5b1f17b1804b1-442dc95a564mr126025345e9.15.1747135420906; 
 Tue, 13 May 2025 04:23:40 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd3af15bsm208511805e9.30.2025.05.13.04.23.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 May 2025 04:23:40 -0700 (PDT)
Date: Tue, 13 May 2025 13:23:38 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 kvm@vger.kernel.org, Sergio Lopez <slp@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Laurent
 Vivier <lvivier@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Yi Liu
 <yi.l.liu@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>, Eduardo
 Habkost <eduardo@habkost.net>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, qemu-riscv@nongnu.org, Weiwei Li
 <liwei1518@gmail.com>, Amit Shah <amit@kernel.org>, Zhao Liu
 <zhao1.liu@intel.com>, Yanan Wang <wangyanan55@huawei.com>, Helge Deller
 <deller@gmx.de>, Palmer Dabbelt <palmer@dabbelt.com>, Ani Sinha
 <anisinha@redhat.com>, Fabiano Rosas <farosas@suse.de>, Paolo Bonzini
 <pbonzini@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?B?Q2zDqW1lbnQ=?= Mathieu--Drif <clement.mathieu--drif@eviden.com>,
 qemu-arm@nongnu.org, =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau
 <marcandre.lureau@redhat.com>, Huacai Chen <chenhuacai@kernel.org>, Jason
 Wang <jasowang@redhat.com>, devel@lists.libvirt.org
Subject: Re: [PATCH v4 00/27] hw/i386/pc: Remove deprecated 2.6 and 2.7 PC
 machines
Message-ID: <20250513132338.4089736b@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250508133550.81391-1-philmd@linaro.org>
References: <20250508133550.81391-1-philmd@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qpsEUJkHqfZlqsviForeTbCDqb2BbFznlGZAAb3LErU_1747135421
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.549,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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

On Thu,  8 May 2025 15:35:23 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> Since v3:
> - Addressed Thomas and Zhao review comments
> - Rename fw_cfg_init_mem_[no]dma() helpers
> - Remove unused CPU properties
> - Remove {multi,linux}boot.bin
> - Added R-b tags
>=20
> Since v2:
> - Addressed Mark review comments and added his R-b tags
>=20
> The versioned 'pc' and 'q35' machines up to 2.12 been marked
> as deprecated two releases ago, and are older than 6 years,
> so according to our support policy we can remove them.
>=20
> This series only includes the 2.6 and 2.7 machines removal,
> as it is a big enough number of LoC removed. Rest will
> follow.

CCing libvirt folks

series removes some properties that has been used as compat
knobs with 2.6/2.7 machine types that are being removed.

However libvirt might still use them,
please check if being removed properties are safe to remove
as is | should be deprecated 1st | should be left alone
from an immediate user perspective.

>=20
> Based-on: <20250506143905.4961-1-philmd@linaro.org>
>=20
[...]


