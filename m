Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oHZaH-0005R8-Ln
	for mharc-qemu-riscv@gnu.org; Fri, 29 Jul 2022 19:39:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHZaG-0005Ql-Bv
 for qemu-riscv@nongnu.org; Fri, 29 Jul 2022 19:39:56 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:45940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHZaE-00088r-GQ
 for qemu-riscv@nongnu.org; Fri, 29 Jul 2022 19:39:55 -0400
Received: by mail-pl1-x629.google.com with SMTP id w7so5829475ply.12
 for <qemu-riscv@nongnu.org>; Fri, 29 Jul 2022 16:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=eJSS3W0KkWa7/lfldHgscIn4YqzTGynq7Iwcq6a1bY4=;
 b=FzBt2c6zOFYmBR4pipFBip0q9zt3pi0PuXqq1BU3m9uv8qahoHSIsAhfKQ969qMv6d
 oj45YLAa0FNpxgofka1qRwnNYiiwLe3hD8YBXNBAaOuPvDbZbw/Gu+vGWPr+StoIyD74
 P8alsFHss1yC+QtRwPL26Vy9dRpl5rc8fr4azMAVJMu65a36zJUcsUyoVvQWhOp6esvh
 37AriQez0x8rNPe80OEstSbXAxm0YdHgNg6WO9/qhUBmosBsyWTh5Elxxg7Be+x+gTE+
 TruNUSiyPrmuM1nlSHxVBfu+FQGkCnSVxKjJYpu6Gk2Iohuzt61jesfvWc2l3FCRui7e
 VmDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eJSS3W0KkWa7/lfldHgscIn4YqzTGynq7Iwcq6a1bY4=;
 b=J4ao2WQCQWS/VFRcmHW6JBdUXsDgBoxcek71xjitYt53Pg4AjvCwNLLHta98ESnthF
 BUwBFt12JExEkqRQAspLKgw0HFN5YUusu2Dzqr/bPjY/eji2pU6McZl5u1PrjVwBDpWL
 gxbcrnPvs+bFi0U1Y5iiqu05KKOXbz66+RSa6Hy2wQ53+xdFkS61upGBQFEDhhHzqT6h
 G6ceEFBtBE3Ns31wjlsUuxWmYl0frhIWvZd0iiAUrK3GUO5GIcntT0RIGvyXzQXuKkEV
 Az2eY1019l4m2AzsOrH4qZj7zeLW+ujyl7pufxloUPcFOacltDmSUEyTHiN2IKzSvh8Y
 AmgA==
X-Gm-Message-State: ACgBeo05ZHHnxe6Elp0rxIxq0BoTBqaCc0bNG9vN7yuiwL6je5K/YK/h
 8jvVSH4EB97WYT0ywgZyqz8EBg==
X-Google-Smtp-Source: AA6agR5nHalAT+HGu1I0mSvaoNE4cspxztpyF2NWiiDhymhiP8DhbUm4of3nUXJk+K5EyHd/B6kRcw==
X-Received: by 2002:a17:90a:ead3:b0:1f3:366d:5005 with SMTP id
 ev19-20020a17090aead300b001f3366d5005mr5549752pjb.1.1659137992414; 
 Fri, 29 Jul 2022 16:39:52 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:a427:660:88d4:8559?
 ([2602:ae:1549:801:a427:660:88d4:8559])
 by smtp.gmail.com with ESMTPSA id
 127-20020a620585000000b0052516db7123sm3448759pff.35.2022.07.29.16.39.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jul 2022 16:39:51 -0700 (PDT)
Message-ID: <edca0c3d-e7d5-6797-03cb-56fc7d955925@linaro.org>
Date: Fri, 29 Jul 2022 16:39:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 03/11] goldfish_rtc: Add big-endian property
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>, QEMU Development <qemu-devel@nongnu.org>
Cc: Openrisc <openrisc@lists.librecores.org>,
 Laurent Vivier <lvivier@redhat.com>, Anup Patel <anup@brainfault.org>,
 Laurent Vivier <laurent@vivier.eu>, Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:Goldfish RTC" <qemu-riscv@nongnu.org>
References: <20220729230117.3768312-1-shorne@gmail.com>
 <20220729230117.3768312-4-shorne@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220729230117.3768312-4-shorne@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Fri, 29 Jul 2022 23:39:56 -0000

On 7/29/22 16:01, Stafford Horne wrote:
> Add a new property "big-endian" to allow configuring the RTC as either
> little or big endian, the default is little endian.
> 
> Currently overriding the default to big endian is only used by the m68k
> virt platform.  New platforms should prefer to use little endian and not
> set this.
> 
> Cc: Laurent Vivier<lvivier@redhat.com>
> Reviewed-by: Anup Patel<anup@brainfault.org>
> Signed-off-by: Stafford Horne<shorne@gmail.com>
> ---
> Since v2:
>   - Added Reviewed-by
>   - Changed from enum property to boolean as suggested by Richard

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

