Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6395EEB64DA
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 11:11:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qIonR-0002fp-LC; Mon, 10 Jul 2023 07:11:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qIonP-0002eT-Sl
 for qemu-riscv@nongnu.org; Mon, 10 Jul 2023 07:11:11 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qIonO-0003fi-6s
 for qemu-riscv@nongnu.org; Mon, 10 Jul 2023 07:11:11 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3fbfa811667so23326845e9.1
 for <qemu-riscv@nongnu.org>; Mon, 10 Jul 2023 04:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688987468; x=1691579468;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/Q65nz3su02HpAugcKZK5cPX61qA+KCE+tRUgxH0yb4=;
 b=Q7wUft0fsbjzi0natv9S6Y/xJFjiAX6Wx1dxkl3lpaanELOpy9N8aOM8cK4/3uxiek
 AZHzbyVEzswKX6jkFz9Q6S9vp4+U0jt16nOzQmFs4KucTLP2p8fW1YkQNB+I4LIBNal8
 NGgS0dfJO7AD3DjYJQfnRJbCS3ARe6fH7EcRGLJkzCh66yA8vRb3N3hp6T2dUGkDfdZS
 HQL9+lndkdQIf2RhGkTo0QCnGFXqkr4fw4sK1Ae19NFZmmQyjXXOSuYMJpXL1Jh+sCrs
 XLSnugGzZ3emcKEKHKEu5uYwvMlvjg8ufZVKwLxYG+duA1o9sMwiRBSkxO7f/5gviCZN
 Nd2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688987468; x=1691579468;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/Q65nz3su02HpAugcKZK5cPX61qA+KCE+tRUgxH0yb4=;
 b=AA/YOe4lfJ/L3ll0NV33yMD6hYH/3HPttUunnXj+nLX6jOM3Z9KyaCx4jwo8KJudXL
 mjj6Py+lkCanv2GRgaA7DTi2HlItpMQg8ipO/hjiUE30xHukuGc51Tc095T9wvDMpsFt
 Y3QJCx53+XC4yQPZrM7kQLUTdhim/i3nP+CocpZgK3SgTHR9zvUKSSWlSx8zCzsU5HGe
 zDb4llfYC9wQzu6y4Nf9U8EDEIAUh7caFNhxuDSmivLS7xId0TXF4EzEez/ewuAB7kS9
 zVgQHqJqL77g3NDJk4kxUUea4+es14E7GnIZXJyZuSWdjl0dSk64iQTeED/q4266GFXj
 XClw==
X-Gm-Message-State: ABy/qLZk/52ss3qYFVInguyyzdW4/vh2rphyqx9du/tfj3FvcP2s53kn
 W4cwooGnn7V7HBJnpFGpYbXsdQ==
X-Google-Smtp-Source: APBJJlHo17Y/3CuySKJlb8oc8juLjvntMWuafRXQXh2RTOGu5aMYKNJZWSLYL28K1oYFnxFjnVLF6g==
X-Received: by 2002:a05:600c:a6a2:b0:3fa:955a:9291 with SMTP id
 ip34-20020a05600ca6a200b003fa955a9291mr13908957wmb.9.1688987468296; 
 Mon, 10 Jul 2023 04:11:08 -0700 (PDT)
Received: from [192.168.69.115] (mst45-h01-176-184-47-225.dsl.sta.abo.bbox.fr.
 [176.184.47.225]) by smtp.gmail.com with ESMTPSA id
 t4-20020a5d5344000000b0031417fd473csm11465115wrv.78.2023.07.10.04.11.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jul 2023 04:11:07 -0700 (PDT)
Message-ID: <61904add-5dc5-6e17-f306-7fd3cc4b5f5c@linaro.org>
Date: Mon, 10 Jul 2023 13:11:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH 0/4] chardev/char-fe: Document FEWatchFunc and use
 G_SOURCE_CONTINUE/REMOVE
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Laurent Vivier <lvivier@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Amit Shah <amit@kernel.org>,
 qemu-riscv@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20230705133139.54419-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230705133139.54419-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.101,
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

Hi Paolo & Marc-André,

On 5/7/23 15:31, Philippe Mathieu-Daudé wrote:
> Improve qio and chardev frontend documentation,
> have FEWatchFunc handlers return G_SOURCE_CONTINUE/REMOVE.
> 
> Philippe Mathieu-Daudé (4):
>    io/channel: Explicit QIOChannel doc is based on GLib's IOChannel
>    chardev/char-fe: Clarify qemu_chr_fe_add_watch 'condition' arg is a
>      mask
>    chardev/char-fe: Document FEWatchFunc typedef
>    hw/char: Have FEWatchFunc handlers return G_SOURCE_CONTINUE/REMOVE

Could you Ack patches 2-4?

