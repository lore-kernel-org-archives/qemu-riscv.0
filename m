Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB9DCE7A9B
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 16:15:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkoEa-0007pm-3U; Mon, 25 Sep 2023 12:14:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1qkoEX-0007ny-Hi
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 12:14:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1qkoEW-0000KR-30
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 12:14:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695658491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d7TYpatd+73WcDke8sP8ZGJUjuyshMuCmv8QF2XliGQ=;
 b=AwliDv7VVtcjn/FSSz8O0N+320STpqi21YyANEHRoZkjFuoKpPY9Iw7x6IElImTisggOqQ
 yJjGKFEUsUdXtcbeLW1wvtQfP1kPz52PHKYnN5+SLs3n1UOIliK+4ZTnrv9DgiWtRhbAli
 VL1HiHuLcdbhW3AVuGMU8aXSzVW6Xbs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-214-Vwe3aktOPhqb2eTzXgdE4g-1; Mon, 25 Sep 2023 12:14:48 -0400
X-MC-Unique: Vwe3aktOPhqb2eTzXgdE4g-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-40590e6bd67so22450725e9.2
 for <qemu-riscv@nongnu.org>; Mon, 25 Sep 2023 09:14:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695658487; x=1696263287;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d7TYpatd+73WcDke8sP8ZGJUjuyshMuCmv8QF2XliGQ=;
 b=X+r/V7EeaxaxJHJZD1bJmRea4N8Rrr6fRVjRUA416d3lJKA2zjs2kdO5qx4Jn9htK0
 hSlQYL9DMny3JjiOKNHq57CudiA2HhP0ULith7MCTsvn/Qa+BIEtNouY56tBuHAWoAfO
 TxqTeafGj0U543Dtrts+2rtDmgaiAWjVHcIRP7pZeHI575C3352UnueRh++3/9Jpk31e
 LKMo/Ar+7ulx0hba7mfQ6pNuVw2YMLXaA+ySpvcP+PxLrTDWfJUlF7PHlTRxfbdDhTGS
 8SB5hLUwJSQq89u2EsnVfLtEHypzLEQ5Nx7h5ST0a0SeU70+ebV51MqBlCcK5rwc3m/7
 WygQ==
X-Gm-Message-State: AOJu0YyBPzNK1tGYe77UswnXBppheFT64Rh3JDxSZDsLoopjqH+lU9vB
 mY52EhifHSfjQbw8pEvmes5A3KM+NqHSO+KwbOPEu23mZIIpsprW6AkvcCmRQxsbPVyLMqUiHJK
 xJA1yqjNqYzGzOQY=
X-Received: by 2002:a5d:4c85:0:b0:321:4d1d:26f with SMTP id
 z5-20020a5d4c85000000b003214d1d026fmr7075146wrs.29.1695658487160; 
 Mon, 25 Sep 2023 09:14:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQX8GBPai1ApIZIoM4GgsqXePtV4DmgzzoZ7pJtnyo1dZyrJwUFXctMd9qSq1IRcj2M7FHqg==
X-Received: by 2002:a5d:4c85:0:b0:321:4d1d:26f with SMTP id
 z5-20020a5d4c85000000b003214d1d026fmr7075125wrs.29.1695658486825; 
 Mon, 25 Sep 2023 09:14:46 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 j2-20020a5d4642000000b00317e77106dbsm12251727wrs.48.2023.09.25.09.14.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Sep 2023 09:14:46 -0700 (PDT)
Message-ID: <908ae9aa-11fc-8584-bd60-e269a1026e37@redhat.com>
Date: Mon, 25 Sep 2023 18:14:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 08/31] configure: ensure dependency for cross-compile setup
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 John Snow <jsnow@redhat.com>, libvir-list@redhat.com,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-s390x@nongnu.org, Song Gao <gaosong@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Nicholas Piggin <npiggin@gmail.com>, Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Cleber Rosa <crosa@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-ppc@nongnu.org,
 David Hildenbrand <david@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Laurent Vivier <lvivier@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Beraldo Leal <bleal@redhat.com>
References: <20230925144854.1872513-1-alex.bennee@linaro.org>
 <20230925144854.1872513-9-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230925144854.1872513-9-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.473, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 9/25/23 16:48, Alex Bennée wrote:
> If we update configure we should make sure we regenerate all the
> compiler details. We should also ensure those details are upto date
> before building the TCG tests.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   configure | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/configure b/configure
> index e83872571d..a95e0f5767 100755
> --- a/configure
> +++ b/configure
> @@ -1788,6 +1788,8 @@ for target in $target_list; do
>             echo "HOST_GDB_SUPPORTS_ARCH=y" >> "$config_target_mak"
>         fi
>   
> +      echo "$config_target_mak: configure" >> Makefile.prereqs

This in practice is not adding anything; if "configure" changes then 
Makefile's dependency on config-host.mak will trigger a configure rerun 
anyway.

If you want to add it, you should also add it for other config-*.mak 
files.  However, I'd remove this line and just change

-# 1. ensure config-host.mak is up-to-date
+# 1. ensure config-host.mak is up-to-date.  All other config-*.mak
+# files for subdirectories will be updated as well.

in the Makefile.

Paolo


