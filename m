Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtvdy-0000eN-9m
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 12:12:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jtvdw-0000ca-Qw
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 12:12:56 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:41229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jtvdu-0004rA-VA
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 12:12:56 -0400
Received: by mail-pf1-x435.google.com with SMTP id q17so2732247pfu.8
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 09:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qRqlCF7caLfmkcVuclm0vZ4IDFCmNbMkWR5ABSmYfSU=;
 b=RzMVlg7WxenqZDVIzUB4mdrZdoqCh+lFsk1XyqIL5YKPh4h9P6OXjNoFftj2yiUxeh
 CB91O1Ofse6b+fu0P+jkfUJjeb0nCmwZ1OVTNhSE+ukjkES/taEMWrblJHMf8WJvXrLj
 GFjpJhWHOkIOmmPP5vNLgH6fA1m8jhr31nx9lsKuWJgSXXARBECnj7I6Gcdp62Biv7/f
 zIDGaTD97Ts51BMOlW71YRepIrcvqbGpDwdhCMWrY5J+9QsPht2rlSRiWh1C1i2MVayi
 w1K7USzCWkpvHLPlLkoPy0KSXggKbPgpaWUbhpMN7DI5okMVLPNdnWRa+KHYEo/DwwD7
 G+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qRqlCF7caLfmkcVuclm0vZ4IDFCmNbMkWR5ABSmYfSU=;
 b=mMIuX2D5/kmudcyvvoPLCcS+DZSNMY8B/AHPg0YElgwrsesVUFXp5nYyHrgVOaa0Zb
 I/BLpCTTEnOpgSWkXlV+SWydhMfxnD+YT9rhDqFFryCvojzpai4Wg4MyNJNKQSnazzjm
 m4x7wPcMogLvvgEy+qdccJy/ctLzgZQ5/e+kG8+WWuz4JjP5q4SB63zlfpImEGTSUZdz
 z6/P3wWL2q1b6P5npsqNR9LiJQ598WM3Et9NGCH68ZpmXpTeJCTYxsFlVwbAyD5EvkYu
 FjrKz+VcDuNwOP9yOlC+iEp/I8u3JBc97oRgEB9kyY6jHWzkQom5Xn4nPWH5cEdhPuax
 IoSg==
X-Gm-Message-State: AOAM532UaG70r0slK4GsvZ8wAPr0DVt6+izsLjIcB15Dc6K0+g87Cy/1
 eYsIXM6F7eaNAyrw8mVAwYlQEg==
X-Google-Smtp-Source: ABdhPJyo+L8ryJa/OoVwpBeTGr8LRJB7IbK0a+AchsI8D1MtGnuiMYFF+0HlVMU2yexWzA5S5JGSfQ==
X-Received: by 2002:a63:1007:: with SMTP id f7mr58180509pgl.147.1594397573352; 
 Fri, 10 Jul 2020 09:12:53 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id s187sm7257085pfs.83.2020.07.10.09.12.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2020 09:12:52 -0700 (PDT)
Subject: Re: [RFC 01/65] target/riscv: fix rsub gvec tcg_assert_listed_vecop
 assertion
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
References: <20200710104920.13550-1-frank.chang@sifive.com>
 <20200710104920.13550-2-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9be2326f-96d8-7680-d068-6fac66ba0be8@linaro.org>
Date: Fri, 10 Jul 2020 09:12:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200710104920.13550-2-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Fri, 10 Jul 2020 16:12:57 -0000

On 7/10/20 3:48 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> gvec should provide vecop_list to avoid:
> "tcg_tcg_assert_listed_vecop: code should not be reached bug" assertion.
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/insn_trans/trans_rvv.inc.c | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Alistair, this one should be queued for 5.1 as a bug fix.


r~

