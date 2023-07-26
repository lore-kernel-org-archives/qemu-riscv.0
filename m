Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5CAEC0015E
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Jul 2023 23:24:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qOncT-0001WJ-GO; Wed, 26 Jul 2023 19:08:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qOncS-0001Vv-2K
 for qemu-riscv@nongnu.org; Wed, 26 Jul 2023 19:08:36 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qOncL-0007oq-Kb
 for qemu-riscv@nongnu.org; Wed, 26 Jul 2023 19:08:35 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-66c729f5618so376474b3a.1
 for <qemu-riscv@nongnu.org>; Wed, 26 Jul 2023 16:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690412908; x=1691017708;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kIP3ARRQtkrTpnacZ+qv09XeTfOPcl2SLniK4t1QcX0=;
 b=KkFWApxKYSLKKm9gPNlFiqIBUFfsjFSJGfmPD294a2d2KRx8MHGXLE7pazXo4XSD7X
 gXN4yNGkhQcYo5BVR0BSiFJ6uIjU0OIMN9LiI4mKZDOrIevYi2rvgh3I73DmSgjtnog5
 VXP1xxsIREXHDTK5tjAQYB2GnMufikEcQhIPwAoWI9JtU+n4Vd33mkI0PjR0E4WON3Et
 A1BzItvD99sFJSyfe6m9B7SE6k3rg/r2GrzGAAp/Dz2cBTiK93SY3PuQd4sD0U3KbpZL
 KCk/HbEHQ4dpc5BpLmxn9eEtXPBnPGHl8+VqaAQgoTOClx/pFm4lwaWcMNurKoWcWWvz
 vkrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690412908; x=1691017708;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kIP3ARRQtkrTpnacZ+qv09XeTfOPcl2SLniK4t1QcX0=;
 b=i1PVr0p9+0HMYPP/DY52ZDp+3uGNuRUGK8lI42EnPWappxvqZT8mqDHQboB+tyMUkz
 IWR8hkiqn5MqCawr3rYDJdgUnAVT7WP4LOGHG+YFYtPMwp0vm7szqtfhAzig4wfZBHXe
 w1lgY7YeSN09113wLYPdnscbnwarv7JWf3hL712Dg2JDnl9NfXlOYSxdel/kh8dWwcd2
 gpCLy/SZKPGIARwcAFks7l3EEhBxr/53IzRhlPoP/MvJBY1Z2pNjCaet4AGKhoeOZH9G
 c4KHpW0dEfBhqmOnXvABhcccMJ7RQYZcNAC1znoVvu9nl8nGAMRyKTMZFWynvP2hchH+
 gx3g==
X-Gm-Message-State: ABy/qLZmICQJTY4DCcImsjsNSCl4XHL1vPgBwEtiRkBd6+K5WL6f+/cw
 News4xlC9B+tf++tIfYF8UZ9/A==
X-Google-Smtp-Source: APBJJlED/aVlmCEnMgAh2zUkukxUD7wYNdmhr71e0Lj9B8vHiWqCEU2L3wjKGwb9k+oxKRMkdlXGQQ==
X-Received: by 2002:a05:6a20:551:b0:135:9b84:cf43 with SMTP id
 17-20020a056a20055100b001359b84cf43mr2836655pzq.28.1690412908036; 
 Wed, 26 Jul 2023 16:08:28 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:9456:37ab:20dc:17e1?
 ([2602:ae:1598:4c01:9456:37ab:20dc:17e1])
 by smtp.gmail.com with ESMTPSA id
 35-20020a630b23000000b00551df489590sm50381pgl.12.2023.07.26.16.08.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jul 2023 16:08:27 -0700 (PDT)
Message-ID: <24e54bac-9149-20da-e4cf-5829a6dcb174@linaro.org>
Date: Wed, 26 Jul 2023 16:08:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 3/8] machine: Print supported CPU models instead of
 typenames
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com,
 kfting@nuvoton.com, wuhaotsh@google.com, nieklinnenbank@gmail.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, laurent@vivier.eu, vijai@behindbytes.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, imammedo@redhat.com, cohuck@redhat.com,
 pbonzini@redhat.com, shan.gavin@gmail.com
References: <20230726003205.1599788-1-gshan@redhat.com>
 <20230726003205.1599788-4-gshan@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230726003205.1599788-4-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 7/25/23 17:32, Gavin Shan wrote:
> -static const char *q800_machine_valid_cpu_types[] = {
> +static const char * const q800_machine_valid_cpu_types[] = {
>       M68K_CPU_TYPE_NAME("m68040"),
>       NULL
>   };
>   
> +static const char * const q800_machine_valid_cpu_models[] = {
> +    "m68040",
> +    NULL
> +};

I really don't like this replication.

r~

