Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A51A1C46CA0
	for <qemu-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 13:37:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r8hDt-0007XK-NM; Thu, 30 Nov 2023 08:36:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r8hDs-0007UE-Hs
 for qemu-riscv@nongnu.org; Thu, 30 Nov 2023 08:36:56 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r8hDq-0007CO-Sm
 for qemu-riscv@nongnu.org; Thu, 30 Nov 2023 08:36:56 -0500
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-332c7d4a6a7so616688f8f.2
 for <qemu-riscv@nongnu.org>; Thu, 30 Nov 2023 05:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701351413; x=1701956213; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=92EVl/+kAJa1w133nRnLwZdbri5T/CNJ+OGiI8vF/hc=;
 b=hhzErzXQtgBBzvCb1WRbh54SijuwJDwK7Gs5ShgJup2iFhBM6EvSP/66J51VF6NMb7
 hg6sYu+eho8OZH4JGpH+ZYvmlbbNAHEMFvA1Pi5cg+YC/Z7t9eVB93FX85rSAQS0UvMs
 Xs+bzcKezsKxOvSTdCTTwe95jwcWEwdRFxU6qucVxDTHtNCpDZWmTQd62o5mFtI+knaD
 bpB/EtL2ojRD82MRzk68puzMLNVGt7likxTDR2A4MESXP0yGOwxU/bBOu4T4cGr2rAG6
 2DUFqXj2BTbT94xX5UJogkYtTZEkYk3ssC9hpF0fL2y24iWWsWw3jkdl/L/SuDUbgXH+
 1N4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701351413; x=1701956213;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=92EVl/+kAJa1w133nRnLwZdbri5T/CNJ+OGiI8vF/hc=;
 b=esdzTE6LAoeGvhSHAvalHr4CchNg474KBgrvklS9HWsjDMPNbcBzSxaXbHqov2TsWc
 YSA33XVvIqfArb2uV2Z/Z5vsceGlPz4qU603pS8ZeFcNSJBeAz5nvPo1R0rhyl0fEu1R
 d5rHsvcF0y1DMBUe2sKIdAALog1oUQkvDzoKNeITx4IDbHcfPcBYJ8AOeeONcKtbTogd
 8QJpKZboSsVJ5sacH3ylqHraUJVhaIvHcmoN7vSSQ7uxGXbVUKHOBR1fMXQRPlW9ozmg
 RDgZOIZXFCAN0t7/jfnW/SznaZycKkEPS25EyGGkX1UCH+w3/zPeslZT/82nXMnssncm
 DhNQ==
X-Gm-Message-State: AOJu0YwybN6cW8Oob23qd5txeT5phFaVgKOeY/sX6fvuz17zl1qC4TqJ
 rRJgPoDC0xosvZ/Br+78sI1peA==
X-Google-Smtp-Source: AGHT+IGzSdlgStqYT69A2lG9GtqRHhg/niB3F/uN4GK5nKt0eJM7WDiZHR6K1BVe40jqO9Y7LSdkKg==
X-Received: by 2002:a05:6000:10c:b0:333:2be6:860e with SMTP id
 o12-20020a056000010c00b003332be6860emr238311wrx.71.1701351413167; 
 Thu, 30 Nov 2023 05:36:53 -0800 (PST)
Received: from [192.168.69.100] (sev93-h02-176-184-17-116.dsl.sta.abo.bbox.fr.
 [176.184.17.116]) by smtp.gmail.com with ESMTPSA id
 i2-20020adffc02000000b003330aede2aesm1559297wrr.112.2023.11.30.05.36.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Nov 2023 05:36:52 -0800 (PST)
Message-ID: <ce8686c9-ac4b-4bb8-a181-af536ef1097a@linaro.org>
Date: Thu, 30 Nov 2023 14:36:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] qemu/main-loop: rename qemu_cond_wait_iothread() to
 qemu_cond_wait_bql()
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
 Fabiano Rosas <farosas@suse.de>, qemu-s390x@nongnu.org,
 Song Gao <gaosong@loongson.cn>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Hyman Huang <yong.huang@smartx.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Artyom Tarasenko
 <atar4qemu@gmail.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, Paul Durrant <paul@xen.org>,
 Jagannathan Raman <jag.raman@oracle.com>, Juan Quintela
 <quintela@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, qemu-arm@nongnu.org, Jason Wang
 <jasowang@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Hailiang Zhang <zhanghailiang@xfusion.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, Huacai Chen <chenhuacai@kernel.org>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>,
 Jiri Slaby <jslaby@suse.cz>, Alexander Graf <agraf@csgraf.de>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>,
 Eric Farman <farman@linux.ibm.com>, Stafford Horne <shorne@gmail.com>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Cameron Esfahani <dirty@apple.com>, xen-devel@lists.xenproject.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, qemu-riscv@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 John Snow <jsnow@redhat.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Michael Roth <michael.roth@amd.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bin.meng@windriver.com>,
 Stefano Stabellini <sstabellini@kernel.org>, kvm@vger.kernel.org,
 qemu-block@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Peter Xu <peterx@redhat.com>, Anthony Perard <anthony.perard@citrix.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, Leonardo Bras
 <leobras@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20231129212625.1051502-1-stefanha@redhat.com>
 <20231129212625.1051502-4-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231129212625.1051502-4-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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

On 29/11/23 22:26, Stefan Hajnoczi wrote:
> The name "iothread" is overloaded. Use the term Big QEMU Lock (BQL)
> instead, it is already widely used and unambiguous.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   include/qemu/main-loop.h          | 8 ++++----
>   accel/tcg/tcg-accel-ops-rr.c      | 4 ++--
>   hw/display/virtio-gpu.c           | 2 +-
>   hw/ppc/spapr_events.c             | 2 +-
>   system/cpu-throttle.c             | 2 +-
>   system/cpus.c                     | 4 ++--
>   target/i386/nvmm/nvmm-accel-ops.c | 2 +-
>   target/i386/whpx/whpx-accel-ops.c | 2 +-
>   8 files changed, 13 insertions(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


