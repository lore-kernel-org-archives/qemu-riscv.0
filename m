Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jD0Sz-00052Z-Dh
	for mharc-qemu-riscv@gnu.org; Sat, 14 Mar 2020 02:40:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58777)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jD0Sx-00052L-8g
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 02:40:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jD0Sw-0004jU-4p
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 02:40:11 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:34702)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jD0Sv-0004fu-Ua
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 02:40:10 -0400
Received: by mail-pl1-x644.google.com with SMTP id a23so5366794plm.1
 for <qemu-riscv@nongnu.org>; Fri, 13 Mar 2020 23:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UNv7mbFCsIt+gDvuuQ73IFS+2/4+W79RVJ3t+h5YNUA=;
 b=hfrB+W0dHnh8rM6PNmbhBAFukrxIpVjcZgzNTGldMF7Dls/0MPzMOXTu64wYkXf6QR
 JTyH9QylMEr2BKvizj9WzYSdxVwASK/h/ogE3E+J1ciCa5ILI/Ql4E9/CMa3l3sOpnn9
 tlxWH35ztAfJlm7HFHYHcuMJGb6DcnanoEvxfC1jY+QGp2xTgrhAMhdXQTX8m71dGUDi
 KXJvmf1HbVnbaUTV0YwwDDlWLR3mtfx7iWjn2JvlfeaHa4p/1928JUvAFxB+DRVWyDU0
 oZNbPfF1InccVAVOS6Jf6feHSFgbPNYkfE91DCHNVGrpQRP1U+fzgH9evuo/810gsm7O
 U9Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UNv7mbFCsIt+gDvuuQ73IFS+2/4+W79RVJ3t+h5YNUA=;
 b=Ngtnm2G7uhrwvharSLZoS6EdnI5WHaQvOK1/XtyB8ZNFW2Me1V6U2Ki9FDbPchIjXb
 skooYmdnMcWUE4K5p3BRFkFm96dq4mOt0vBKwgOx4dmQYAT3eZdbk1bjEx5yHxzHlNfX
 vGgdjoHYpLc+4QBCyVsQMnQUzLAI/u26lVa+0Y4LVroz/6LzXyuFk77OVW94dDrXc0uc
 x5H2Vf+TNOXK3U+E3RVAYZevV4P5ARbMFB7Azq/8l0mXj0CEvLu9zRB4YUeGBmnQoFey
 cGyUiFPimua1fGa+aafUgQA3FiLM+Z1T3xLRs1+5z6ca6yVsOBg6YBAzsYETN4mMdsB8
 4vow==
X-Gm-Message-State: ANhLgQ3rMHkbNTOlDoliVKgOgCrs69bFduGq0oOYKtGgGwjdHXTUaX9D
 E+YDZkJW/TU2Yk1wwOCbtGa/SnLYPbQ=
X-Google-Smtp-Source: ADFU+vsviXP4RN1t/NVy2G0XJdN8wPqPKy/ymJ/APK6LcxMKKGcjJMOAO4SxBJPTlkhYWQNb4IdZSQ==
X-Received: by 2002:a17:902:8546:: with SMTP id
 d6mr16916258plo.193.1584168008752; 
 Fri, 13 Mar 2020 23:40:08 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 q91sm6949108pjb.11.2020.03.13.23.40.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Mar 2020 23:40:08 -0700 (PDT)
Subject: Re: [PATCH v5 16/60] target/riscv: vector integer min/max instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-17-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dd447400-918e-b253-8bd5-becc485a03dd@linaro.org>
Date: Fri, 13 Mar 2020 23:40:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312145900.2054-17-zhiwei_liu@c-sky.com>
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
X-List-Received-Date: Sat, 14 Mar 2020 06:40:12 -0000

On 3/12/20 7:58 AM, LIU Zhiwei wrote:
> +/* Vector Integer Min/Max Instructions */
> +GEN_OPIVV_GVEC_TRANS(vminu_vv, umin)
> +GEN_OPIVV_GVEC_TRANS(vmin_vv,  smin)
> +GEN_OPIVV_GVEC_TRANS(vmaxu_vv, umax)
> +GEN_OPIVV_GVEC_TRANS(vmax_vv,  smax)
> +GEN_OPIVX_TRANS(vminu_vx, opivx_check)
> +GEN_OPIVX_TRANS(vmin_vx,  opivx_check)
> +GEN_OPIVX_TRANS(vmaxu_vx, opivx_check)
> +GEN_OPIVX_TRANS(vmax_vx,  opivx_check)

As with rsub, it is possible to use tcg_gen_gvec_2s to produce inline
vectorizations of {u,s}{min,max}.  But that can wait, if you like.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

