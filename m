Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5588CC4167B
	for <qemu-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 13:50:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r8hQg-0006Zo-AC; Thu, 30 Nov 2023 08:50:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r8hQW-0006VJ-9V
 for qemu-riscv@nongnu.org; Thu, 30 Nov 2023 08:50:02 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r8hQT-0001If-FZ
 for qemu-riscv@nongnu.org; Thu, 30 Nov 2023 08:50:00 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40b472f98b1so7748855e9.3
 for <qemu-riscv@nongnu.org>; Thu, 30 Nov 2023 05:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701352196; x=1701956996; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MzXC86kI/230MRmOExolGBgQpce+zyW7qougvXLVSk8=;
 b=I25aAQN3MwjonWQAuXfFk0f4HfMOhFTw+vwYH+7LaxUmESp8giU/JcRynvg2cOAK4O
 FWD7RjbjDPJuNzJfgD7AF3l+TAvHpfAzRpkxijP8NhSPqx7FXKVi3Rj5AUl8Mk2PgEo8
 lu2As9DQDyDTONl/qwdnbfLGqFeVoG53EFquA9ex65zkrLcjzCh39o5L+pp2UOKaEYp/
 xeutKbblANB4GiSU+yBeHo/Aoe3bBh3FGOfj98GwJsNf59xTu7vBpChQhj46TdzWj+Am
 It6Fb0V2KAMeHpMqxtEVVc9D+Au5qphui+PQBerUAapilUICqP8bHOFpv32vUrrX8zwk
 kK1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701352196; x=1701956996;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MzXC86kI/230MRmOExolGBgQpce+zyW7qougvXLVSk8=;
 b=Em/JZPU/L0CY4YJC7QfqIsF317/9GO4Swpi2U9uHZonVE+aazCFH/SErnhtkN96ptu
 8cju9rDbOLzdUHpizCic6jqotpBYD76YfHm1iC/dPc4NbExs0jyus4w7E6AFe2BLOjfu
 EPE2a6KrtZuhkd8gMFSRlw5d22SByQC62byfXEJL0O671APnha91m5giMhnYgfFwMc5I
 kbcDazpM/QQHPO1K563Sn3+yQAsktM0oJ54Kxn7ySA3Z4yASS18DfjkQJs+rXyQRtJQv
 PHAC/0Nj4YO2Z/UjwbVSZJMRVYpAxSRzKzy6HO2VVnJGj4Pn8a8HFT/kaF0ja/ukTPz7
 ++ZQ==
X-Gm-Message-State: AOJu0YwGZ/OJ6yLhGK8ENK87nVNpqN5YM12QR+t+GBNtPXrD3JmtYw/3
 LdXWGyk3woStq9tD2k0PGgPc2w==
X-Google-Smtp-Source: AGHT+IGEZM/F60lbKf+pyOaxLGJZDqngSEf0GXts+oJS0AF+AGOPuKqrMqfmt5a2LHBk+wqKglvvAA==
X-Received: by 2002:adf:f588:0:b0:332:eb19:9530 with SMTP id
 f8-20020adff588000000b00332eb199530mr14573473wro.32.1701352195915; 
 Thu, 30 Nov 2023 05:49:55 -0800 (PST)
Received: from [192.168.69.100] (sev93-h02-176-184-17-116.dsl.sta.abo.bbox.fr.
 [176.184.17.116]) by smtp.gmail.com with ESMTPSA id
 h1-20020adfe981000000b00332f6202b82sm1595392wrm.9.2023.11.30.05.49.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Nov 2023 05:49:55 -0800 (PST)
Message-ID: <fcaff24d-0ced-4547-898f-a9b8bf49be45@linaro.org>
Date: Thu, 30 Nov 2023 14:49:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] Rename "QEMU global mutex" to "BQL" in comments and
 docs
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
 <20231129212625.1051502-7-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231129212625.1051502-7-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 29/11/23 22:26, Stefan Hajnoczi wrote:
> The term "QEMU global mutex" is identical to the more widely used Big
> QEMU Lock ("BQL"). Update the code comments and documentation to use
> "BQL" instead of "QEMU global mutex".
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   docs/devel/multi-thread-tcg.rst   |  7 +++----
>   docs/devel/qapi-code-gen.rst      |  2 +-
>   docs/devel/replay.rst             |  2 +-
>   docs/devel/multiple-iothreads.txt | 16 ++++++++--------
>   include/block/blockjob.h          |  6 +++---
>   include/io/task.h                 |  2 +-
>   include/qemu/coroutine-core.h     |  2 +-
>   include/qemu/coroutine.h          |  2 +-
>   hw/block/dataplane/virtio-blk.c   |  8 ++++----
>   hw/block/virtio-blk.c             |  2 +-
>   hw/scsi/virtio-scsi-dataplane.c   |  6 +++---
>   net/tap.c                         |  2 +-
>   12 files changed, 28 insertions(+), 29 deletions(-)


> diff --git a/include/block/blockjob.h b/include/block/blockjob.h
> index e594c10d23..b2bc7c04d6 100644
> --- a/include/block/blockjob.h
> +++ b/include/block/blockjob.h
> @@ -54,7 +54,7 @@ typedef struct BlockJob {
>   
>       /**
>        * Speed that was set with @block_job_set_speed.
> -     * Always modified and read under QEMU global mutex (GLOBAL_STATE_CODE).
> +     * Always modified and read under BQL (GLOBAL_STATE_CODE).

"under the BQL"

>        */
>       int64_t speed;
>   
> @@ -66,7 +66,7 @@ typedef struct BlockJob {
>   
>       /**
>        * Block other operations when block job is running.
> -     * Always modified and read under QEMU global mutex (GLOBAL_STATE_CODE).
> +     * Always modified and read under BQL (GLOBAL_STATE_CODE).

Ditto,

>        */
>       Error *blocker;
>   
> @@ -89,7 +89,7 @@ typedef struct BlockJob {
>   
>       /**
>        * BlockDriverStates that are involved in this block job.
> -     * Always modified and read under QEMU global mutex (GLOBAL_STATE_CODE).
> +     * Always modified and read under BQL (GLOBAL_STATE_CODE).

Ditto.

>        */
>       GSList *nodes;
>   } BlockJob;

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


