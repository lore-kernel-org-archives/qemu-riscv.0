Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jCyPQ-0008R8-1F
	for mharc-qemu-riscv@gnu.org; Sat, 14 Mar 2020 00:28:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47887)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jCyPN-0008Qt-Vu
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 00:28:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jCyPM-0006fV-Q5
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 00:28:21 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:41991)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jCyPM-0006eq-LB
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 00:28:20 -0400
Received: by mail-pl1-x644.google.com with SMTP id t3so5257172plz.9
 for <qemu-riscv@nongnu.org>; Fri, 13 Mar 2020 21:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=v3irUYJB8xzUOoxpLWF+E08cxO2jUpY38vqkPcXTIM0=;
 b=ftTbDTyKAl1YcxNiDTidYRpyN6OHpSO2R/amGwE4sgEOzph+fSpZGjTMPZtRO6ayBm
 JHwJam6qz1qZ7urqrmpt4YUzK06o+scCDdNqFXIZtDhgilsv6H0tjvOnNiOhmKapKPPd
 zpl/UpRsKTbQQAhiuva2N+5ywWUIbHh++sLHOGw/nphg50I9RrQ0WbYwsyDN21Mjg9U2
 vjWwV3yvs4+lrXgsaywAZSxWXM/mS0twcqDw3AS4ltsWN+pn4GBxEuFNlBbeRxgceztl
 MmG6VxETLXYl09ilC5R8juh4RJcv1IPYKXTsU4/plRknVWf1LQFZHcKa1c9L0Ds0RQWd
 FwGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=v3irUYJB8xzUOoxpLWF+E08cxO2jUpY38vqkPcXTIM0=;
 b=fciw8iN70zEXt7DXLbYSYLWNRA7+orIcBQ9fj+GWQnpiqndk88IiFZqb/lSpxOEuFB
 m8yW/xBF/oWmjSx/aCbsqZf8WXy22cU1+4jWINlrIXwi8SvopOXtgUWCh/z/j0TxzxW4
 FKMMc36eha8rWIkbvl6UJhmnIS3eRc+TmEPyvlwTUcwa6eIabCziAz4JOypAZ/U5Srz2
 5+zR52GqhawvMZXfyLNl4Ys1Wb8BRBIRj+8qISHwujnkEE7cdIqEqq2w3Lz41k+9F4E/
 qCbiTEkxJGJS06oTL4I5ryM2WvaABqliXG3jiImLnLcpwrf5P7tR3kNCqO9uEus6HyQE
 m03g==
X-Gm-Message-State: ANhLgQ2m+PgjF28Cp83g8AtG8u6ll5Myv9K4Y4ym7Grz1Gdz3cetI3ce
 G39Z1GCNyaDDL2LYv/eKRzUOSkW2Fz4=
X-Google-Smtp-Source: ADFU+vtNzoSmiBTYHVlq3MYjaH/AxmfGWmDj7ULyxfN+8TUfvHT/ydtRZO8bIlBG2R/m8oxAfytfpg==
X-Received: by 2002:a17:90a:33d1:: with SMTP id
 n75mr13031213pjb.167.1584160099141; 
 Fri, 13 Mar 2020 21:28:19 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 o129sm6644124pfb.61.2020.03.13.21.28.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Mar 2020 21:28:18 -0700 (PDT)
Subject: Re: [PATCH v5 08/60] target/riscv: add vector amo operations
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-9-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ca349778-4672-6887-15c5-a825702023d9@linaro.org>
Date: Fri, 13 Mar 2020 21:28:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312145900.2054-9-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 14 Mar 2020 04:28:23 -0000

On 3/12/20 7:58 AM, LIU Zhiwei wrote:
> +    static gen_helper_amo *const fnsw[9] = {
...
> +    static gen_helper_amo *const fnsd[18] = {
...
> +        fn = fnsw[seq];
> +#ifdef TARGET_RISCV64
> +        if (s->sew == 3) {
> +            fn = fnsd[seq];
> +        }
> +#endif

This indexing is wrong, since for seq == 11 you index past the end of fnsw[].

You need something like

    if (s->sew == 3) {
#ifdef TARGET_RISCV64
        fn = fnsd[seq];
#else
        /* Check done in amo_check(). */
        g_assert_not_reached();
#endif
    } else {
        fn = fnsw[seq];
    }

Otherwise it looks ok.


r~

