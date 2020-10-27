Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kXTz0-0000gj-EF
	for mharc-qemu-riscv@gnu.org; Tue, 27 Oct 2020 14:46:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kXTyx-0000fF-SL
 for qemu-riscv@nongnu.org; Tue, 27 Oct 2020 14:46:07 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:34315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kXTyu-0006OQ-IY
 for qemu-riscv@nongnu.org; Tue, 27 Oct 2020 14:46:07 -0400
Received: by mail-pg1-x541.google.com with SMTP id t14so1313280pgg.1
 for <qemu-riscv@nongnu.org>; Tue, 27 Oct 2020 11:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WEGB00gKH/k4VlfeScpKtujT9Ah0HC3vbWmmS+rHb3Y=;
 b=WdvTd+f1xC6USJpBeh6SKrcrBQaHqxtbwhRTwzy9u12UW29UTdNWD1ydPBEIsV4Aep
 HJwym6Bocxvrf7gWkiDiZEUeHE87YJAB/Va5QZGnxNgxIUDGmY2OdE7zN6Q3kkmmX1lf
 QjZS7EFA8Gv6mD9nYjsgfXkbHAkImu1kkT9zO+jDMFn101G2OceveTDQyFlMI9Kq07u2
 yRmLPaxEvFradhVhpA5gwIXRNrLQbAEPatwFkc3RMcPcXyxI8TMWH5/qSnhmt2KtcQHC
 l7Vt8Tx7bPqWJy+G1qZs/IGSdtFwzvyCYSWjguFTtCsbGhSukayj4uF6J484peqFlB7F
 9H8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WEGB00gKH/k4VlfeScpKtujT9Ah0HC3vbWmmS+rHb3Y=;
 b=Z8MCiQO+ZcEBUd9FZShApQDwRRrp0Gju5ZlNz3wDGAMfXPn1QxsvJQ24yZ5t+SzheY
 15mLU5odHBSLQANaDrwF2mBRwl2Hqdh5CKwn2pety7fp8zEKzrPR9XBFIrubqxJ7b8PW
 cu0wcJvT4D3uQ/Uxp5cclnnIK15+2+Nhz/qajGsEq8Z+Z7DleWnkFz441+wyLWdhH25D
 QOxaM686a+kXcg7gWOVTthiK2g7srYYA9PG0FLTaWncIj1DwDcLHk5YMflzAInGJm7DI
 8UOLY+M8mv6RLtpDBKDbqkJMvTqIoNN4R0jGWBaOvGGDvpV1ZTiHJi8VdwJV7wfM3B0w
 uVKg==
X-Gm-Message-State: AOAM530wrlN0ZPbCZ/3Bhg3O7t8Bv6ed7uz7Y2kE6yyDTD+TwqXfFB44
 /AZxf7IuYQ7RWha2w8TYvSfnOQ==
X-Google-Smtp-Source: ABdhPJx9SwmOCtU6Rl56InsoWfiLo/gfVcN6hp9fy/QuGum3DHU2q1xuda0aGvS7bkgWyyaj7Vk6dQ==
X-Received: by 2002:a62:be04:0:b029:15d:7423:e320 with SMTP id
 l4-20020a62be040000b029015d7423e320mr3523845pff.42.1603824363057; 
 Tue, 27 Oct 2020 11:46:03 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id m13sm2684957pjl.45.2020.10.27.11.46.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2020 11:46:02 -0700 (PDT)
Subject: Re: [PATCH V4 1/6] target/riscv: Merge m/vsstatus and m/vsstatush
 into one uint64_t unit
To: Yifei Jiang <jiangyifei@huawei.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, victor.zhangxiaofeng@huawei.com,
 wu.wubin@huawei.com, zhang.zhanghailiang@huawei.com, dengkai1@huawei.com,
 yinyipeng1@huawei.com
References: <20201026115530.304-1-jiangyifei@huawei.com>
 <20201026115530.304-2-jiangyifei@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <91908cb7-0677-96f1-327d-e69f8094fec3@linaro.org>
Date: Tue, 27 Oct 2020 11:45:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201026115530.304-2-jiangyifei@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.167,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Tue, 27 Oct 2020 18:46:08 -0000

On 10/26/20 4:55 AM, Yifei Jiang wrote:
> -    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatus ", env->mstatus);
> +    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatus ", (target_ulong)env->mstatus);

This is truncating mstatus to target_ulong, i.e. breaking the output for
riscv32.  You should use PRIx64 and print the whole 64-bit value.


r~

