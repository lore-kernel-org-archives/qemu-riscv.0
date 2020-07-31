Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k1YYA-0002Hi-FS
	for mharc-qemu-riscv@gnu.org; Fri, 31 Jul 2020 13:10:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k1YY9-0002Gh-Lf
 for qemu-riscv@nongnu.org; Fri, 31 Jul 2020 13:10:29 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:38644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k1YY7-0005g6-2E
 for qemu-riscv@nongnu.org; Fri, 31 Jul 2020 13:10:29 -0400
Received: by mail-pj1-x1036.google.com with SMTP id e22so8164743pjt.3
 for <qemu-riscv@nongnu.org>; Fri, 31 Jul 2020 10:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BaLSTqvrAbbIVKZgB0PMhSdfcixJzZBLbsjsxOPCkKk=;
 b=Bg+iObOtu8KgvEzYel/2I9FBo5q2DM80PcQUKnMNMZgs22w3G0D7xeAXC8oDlxrsxv
 /ufTMpFKeBddjW+Gk7gOqzQcsU4wlrPzkU5hyaGy/D8DA/0Cn4XHo0ZzMEdmo3lMH9wd
 xFM+7o2YkN2QJ9oETYI1JShUyN+4XYI52zIiLOmBLI4KKFbb6orNdhtHLVyFw4q5oNjz
 wbS2KpXj3ghfamD8SE7XTpAlknIWIvJmOYMqtgsiYme8ZSNypnlZu99+PZpaa/SYu2Gz
 lFGPVB0rxCv9zRHxSEDDw8Tp8+B1HhxqBb2+LGHuTH2Aw3EUqN6SZNooTr23WY5NdqvT
 Q2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BaLSTqvrAbbIVKZgB0PMhSdfcixJzZBLbsjsxOPCkKk=;
 b=IVcwiKUyMcNvqghZ5hI/ff/zQ9YXB8ToXeoZ63sYsYzeu5pH2lKz9DZcaHPB/z/Fud
 B2X+/z8PU1qyrPvIux1HAVDzrYNPkbqm8/2YV4K+zAPx5QIdZsAk8+s541jDb1Xzu4x1
 N0cYyMy90YxjLzrC4JTsgyDCb889n5qswRg+xk+qpjGe65UusAt59sGqfHZIXITyS23b
 +Sml0h/xhpwNZFaK5u136xmY+z6hG6VYUr0gWMQSYk7/Z59t9QM+TCJNXrDxchuJKmT+
 H3+0JyE1JtZel3Dk62kLjFWWcnqGLLHz0Zaxb6cChRmjGzce6Tq1guFRft0vbMz2rv1g
 Em8g==
X-Gm-Message-State: AOAM533SO01fFQH2nSkuUFSAqU/iFyxskctHbsLjsghXa0itxHGSPnej
 Y6MifxofUCWkgNjxMvwTk3fBFw==
X-Google-Smtp-Source: ABdhPJyPc2PEDOeLTq5M5lA1z7BrBJ76EVxQ9HwonMiWz5UjLYYIXBLw2bHK0AsnGKjVhx5qgefCVg==
X-Received: by 2002:a17:90b:3d7:: with SMTP id
 go23mr4609448pjb.44.1596215425145; 
 Fri, 31 Jul 2020 10:10:25 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id z77sm10865806pfc.199.2020.07.31.10.10.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jul 2020 10:10:24 -0700 (PDT)
Subject: Re: [RFC v2 71/76] target/riscv: rvv-0.9: widening
 floating-point/integer type-convert
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-72-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4b58f990-5fd6-6528-6554-986c4f849463@linaro.org>
Date: Fri, 31 Jul 2020 10:10:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722091641.8834-72-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 31 Jul 2020 17:10:29 -0000

On 7/22/20 2:16 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/helper.h                   |  6 ++++
>  target/riscv/insn32.decode              | 13 +++++---
>  target/riscv/insn_trans/trans_rvv.inc.c | 43 +++++++++++++++++++++++--
>  target/riscv/vector_helper.c            | 29 ++++++++++++++++-
>  4 files changed, 83 insertions(+), 8 deletions(-)
> 
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index d74dbffc21..03330fa332 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -977,12 +977,18 @@ DEF_HELPER_5(vfwcvt_xu_f_v_h, void, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_5(vfwcvt_xu_f_v_w, void, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_5(vfwcvt_x_f_v_h, void, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_5(vfwcvt_x_f_v_w, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfwcvt_f_xu_v_b, void, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_5(vfwcvt_f_xu_v_h, void, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_5(vfwcvt_f_xu_v_w, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfwcvt_f_x_v_b, void, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_5(vfwcvt_f_x_v_h, void, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_5(vfwcvt_f_x_v_w, void, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_5(vfwcvt_f_f_v_h, void, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_5(vfwcvt_f_f_v_w, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfwcvt_rtz_xu_f_v_h, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfwcvt_rtz_xu_f_v_w, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfwcvt_rtz_x_f_v_h, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfwcvt_rtz_x_f_v_w, void, ptr, ptr, ptr, env, i32)

As before, no rtz helpers.

The rest of it looks ok.


r~

