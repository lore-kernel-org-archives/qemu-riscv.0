Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92996C83F09
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 21:02:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uZFFP-0003Kx-Rf; Tue, 08 Jul 2025 16:49:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uZDrp-0000DL-KJ
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 15:20:41 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uZDrj-0000ND-IS
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 15:20:35 -0400
Received: by mail-qt1-x836.google.com with SMTP id
 d75a77b69052e-4a9b08740e3so33015851cf.3
 for <qemu-riscv@nongnu.org>; Tue, 08 Jul 2025 12:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752002427; x=1752607227; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VavxpCGYW3WjRI/O9ptGzHonaVxScT/pqQ/nt40jf1E=;
 b=OdVjjTZ/7pHeReP67DfIC7M99GEWpsXDPJ9h5eNMIjnvsP2W/XKw+e5jVt4D5xfeBA
 BhdNYIJNuuBTEH7YYQnsEMmQFdAPWqUzl/ePhWpgkLDuatKgWnB7PpZ6PR5hJ9mnFb7U
 MzRwHL/mdi6CMiokWEgohW11iD11JUesbpogzNM8xutvEHnmjZoZFWxJlxuaWOcnWuEz
 qOHIfD5yMEchX+AD871genWlaawikdd7OD/BIyGpc/BMioTwwfmQOveqQQrtlNd2jGmj
 X8A6DLVkStL9dSHqjsd3OmKke4v5/iNDYYy0t9448hc6GbqE9PuT6fiOeS1Lb10LBIXW
 rlMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752002427; x=1752607227;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VavxpCGYW3WjRI/O9ptGzHonaVxScT/pqQ/nt40jf1E=;
 b=dZB62pv0w5hYLLtiwS8EXVqEP6LSdF/auDHPmW+xLAU+5/tCU0PD/PXXqcfCXFgJ1u
 sxKG832NyYuSRfd4SAskHCstkwU2h/3vUltDc6NKnVxNfLAZJLD6bqwn6sA8Y0lVUIOm
 ToFTl5BUy1E8r0z1Hh9IwUVBFozp7EAt59sOYa7Yc1nzfKHqlUnN0Hq42wuTNkFc6E9N
 g0qaZD99At+7ay3zR0oLw/TilyaLGyW/E9nMqvN3BpsObZ6AwOIssRjh/oON7R3RQsRi
 xGkeKbVeSO3Ze6fIwGsLQFi/2tkhXwe/fXaZXNHFEZPxvdpnYNddlrN9VLWCPUhAAmgQ
 qvgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLV9l8FOfCeRA39nvSfz896yFRcIk3vSWo+ZFfuwIEds2DiVgtl2NxOlpfIESlMYYT1llH95kSLGxg@nongnu.org
X-Gm-Message-State: AOJu0YxQ2gexpfLgYDNyFCcb61rPBu+Erf8qpfrCzzxM/t5qVDJ/+H8E
 u2qdPoAU49oknZBFwqPd/9wONDEwHk2D3h4eM1vI6Ljf3CZJV5MvY6FlmbsYZkt7hp2Ixaxi9Wo
 xtucF
X-Gm-Gg: ASbGnct46cDBdE4PwwaN8W28ccKewsoN+Edc0LhK7UjGWoLXfRuSErZThVEMoRXAXoQ
 YRHpFxHlC1b1qARGVjzXftXWOgiIt/RoOLAIrzHXKtfOGR2U6YE6ffJaDcQkgUUKlGeIjMtNSmG
 VQ6RSamHnHBE4vkiriNV3sePqATQIwvR7un0vxo4xg5bnJsFMoVLXAtA/K9twqg13kn1lrHLxuO
 GJOQOc/aqeSs5r6JE63+5cDoOFIJO1Gg9Q/hMSyB0YFDmbe4H0LU7VysUQWFKVC7UGI+e2eWjgw
 Na/dauDmnKmmLvtEzy9gxubMo9lL11jdF2g6Izo9VfFzoz5JZ7lK2QseNjKEEzCudgA7CMwvPmw
 Cz7Ru6qXgrQ==
X-Google-Smtp-Source: AGHT+IH1TrqVdDZnL83UmlKP/eSa5V6sbdZmX/YtS9jzCRhNDrXt5cY1wnW4fzua/yxt3ZWtWHOZeg==
X-Received: by 2002:a05:6a00:2d8f:b0:746:26fe:8cdf with SMTP id
 d2e1a72fcca58-74e4162eb0dmr359749b3a.7.1751996013912; 
 Tue, 08 Jul 2025 10:33:33 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74ce417ddc9sm13152318b3a.105.2025.07.08.10.33.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 10:33:33 -0700 (PDT)
Message-ID: <a53d8594-3311-4b34-bef8-ef66c71f9b4f@linaro.org>
Date: Tue, 8 Jul 2025 10:33:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 v7 5/8] qemu: Convert target_words_bigendian() to
 TargetInfo API
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org,
 qemu-ppc@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>
References: <20250708171949.62500-1-philmd@linaro.org>
 <20250708171949.62500-6-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250708171949.62500-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-qt1-x836.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On 7/8/25 10:19 AM, Philippe Mathieu-Daudé wrote:
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/exec/tswap.h       | 13 +------------
>   include/qemu/target-info.h |  8 ++++++++
>   cpu-target.c               |  7 -------
>   hw/core/cpu-system.c       |  2 +-
>   hw/display/vga.c           |  2 +-
>   hw/virtio/virtio.c         |  2 +-
>   system/memory.c            |  1 +
>   system/qtest.c             |  1 +
>   target-info.c              |  5 +++++
>   9 files changed, 19 insertions(+), 22 deletions(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


