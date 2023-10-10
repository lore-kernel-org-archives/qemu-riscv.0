Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A4ACD80B7
	for <qemu-riscv@archiver.kernel.org>; Tue, 10 Oct 2023 12:01:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqBQ7-0002wh-Du; Tue, 10 Oct 2023 08:01:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qqBPj-0002hW-Lk
 for qemu-riscv@nongnu.org; Tue, 10 Oct 2023 08:00:47 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qqBPh-0001LV-1v
 for qemu-riscv@nongnu.org; Tue, 10 Oct 2023 08:00:39 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-9a6190af24aso966276066b.0
 for <qemu-riscv@nongnu.org>; Tue, 10 Oct 2023 05:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696939233; x=1697544033; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e/VU4sSDcsunTSShOCZItFXGeYVcyUHw7YLpSt9d9YQ=;
 b=pqmJCjjikhEBOXPGt5vGqxVALf/725aOP1Gmzfd0OvGIg7lztT+9zYyPqcw4MmzrYJ
 71RFsQ9IFoCcpwSHP2VM+Rk5se7zyO7kpiiAiHZT5p9QGdg6k2OYdVWxM0sTE638M4bm
 Fr4mzdW1Ba03WqGk0hp4wec5gqgDFuH7PiE5y9EuQGBt+p/StiF9ohtvHMfraTwXk1Cc
 Z5QaYZSaKmujETFD9A1PTqaOtf6Rt4Wf0PpjgmYRFXzPR3kSUE5zkvGonDnYl2hcc1yG
 qltNciOnhD8UxP2gJIbSVJ+1lzaUa3Nb1hGAZ4cUKKju3jEqY5zx9imCqEvqZqt+lDkv
 m/Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696939233; x=1697544033;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e/VU4sSDcsunTSShOCZItFXGeYVcyUHw7YLpSt9d9YQ=;
 b=JFoLpV39My57gzTNfD8Qk6DwSS6xcZMwh/0HQ+6UBB0GpjcfJcfBJ3q2W9KitEx7+h
 q9Qb80xsTCXW0OGizProSBmNzfOxP0BJrzJRbIIpD8h+thSOzDDc/UnErFwXPnQ2FB7c
 1G6eYB8iqwrVKT2VMdzr5oo0o1wcDrahnr2lPtvwKCgNH7Yvehe+a0EzT3TeP77/mcFH
 /J33aYApRs7xb030T7qoSF814d4vik+DY8Ryxkh3t6eLlLFvLXc5JuyN5B07x9VBLlkd
 sMLvfTgfXZYj96NMliVzgOvOCuPIdnxrfqnO5h+05NuCeEkUKCnEgPdkImUnvoA5EEGs
 +BSw==
X-Gm-Message-State: AOJu0YypXLZqXaYeHSFv5xmsEGWJ+UJF+rUcU3oa4PiTAy5DN1YQkxH1
 Pna3HZ4xNwy4maychf1HQFS5lg==
X-Google-Smtp-Source: AGHT+IHjqlnZyuoUGLy/z+F7vPd+t49tWXIPGQ4iwTVJZwE8gIHMluJ56cJ0jjE9z0IRpIBuRjBPXQ==
X-Received: by 2002:a17:907:7790:b0:9b9:facb:d950 with SMTP id
 ky16-20020a170907779000b009b9facbd950mr9906577ejc.72.1696939233509; 
 Tue, 10 Oct 2023 05:00:33 -0700 (PDT)
Received: from [192.168.69.115]
 (aif79-h01-176-172-113-148.dsl.sta.abo.bbox.fr. [176.172.113.148])
 by smtp.gmail.com with ESMTPSA id
 ks8-20020a170906f84800b0099b6becb107sm8466800ejb.95.2023.10.10.05.00.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Oct 2023 05:00:33 -0700 (PDT)
Message-ID: <ec633e3d-d6a1-4e91-bfb1-85f064dc420e@linaro.org>
Date: Tue, 10 Oct 2023 14:00:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 25/25] contrib/plugins: fix coverity warning in hotblocks
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, 
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Brad Smith <brad@comstyle.com>, Radoslaw Biernacki <rad@semihalf.com>,
 David Hildenbrand <david@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Nicholas Piggin <npiggin@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, Leif Lindholm
 <quic_llindhol@quicinc.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 John Snow <jsnow@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-arm@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Maydell
 <peter.maydell@linaro.org>, Yanan Wang <wangyanan55@huawei.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Beraldo Leal <bleal@redhat.com>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-s390x@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20231009164104.369749-1-alex.bennee@linaro.org>
 <20231009164104.369749-26-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231009164104.369749-26-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 9/10/23 18:41, Alex Bennée wrote:
> Coverity complains that we have an unbalance use of mutex leading to
> potential deadlocks.
> 
> Fixes: CID 1519048

Fixes: a208ba09bd ("tests/plugin: add a hotblocks plugin")
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   contrib/plugins/hotblocks.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)


