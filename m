Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pYA9H-0003Mh-8h
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 13:28:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYA9E-0003KB-So
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 13:28:53 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYA9C-0003RO-AH
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 13:28:52 -0500
Received: by mail-pg1-x533.google.com with SMTP id bn17so2019723pgb.10
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 10:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677868128;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LoZb7kZpDNBxZK1p2F/ZV69oRoy1TbL2psWLYdpfQU0=;
 b=ZUFDIfBFMlADJFwzSYthFG5z/3Gk95G8I+D3BffJrWkpWddOFosbOGUSp1NR2CVyjP
 YeEsLqNCPk0B42bmgI55+gsinA1JmlcJSS1pAw+27Dp/tNdt4H1IzeyCDkLLWRsyoEeg
 C2EUMsSO8hyUWw9vsH6uHKlPBHpiIUDgMC5e4bTlf8wgFUdMvv6EV1tao8GOt9+WfmYM
 fiVCw7uhv5gpU+g2FLpaWX45Tbiawm2u5AR/L3AuaiKb6vVGVjrnJmtquyCGDcSkqj9m
 JrowgIvW8ecYTQVW4OMvowrexPnK7o4MATm5Uq9n6Jjl38feePzoXO3nRQU7y8KaLVDH
 Tk9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677868128;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LoZb7kZpDNBxZK1p2F/ZV69oRoy1TbL2psWLYdpfQU0=;
 b=3IU72kg5AWp4DNlRzDFQPV90uIG217QQ28wAnUyzxhYYc6wP4EkYNCCQ5I4aQGakSp
 kVfrxhGj0BSUohhqo75bQKl8KiSX9j7fPnPaf42K00KraS/PNYQUQYKYSMWcZU0LmWKz
 ClI6t9efppz4wxMlBowZli1wsIDp7LAD1OTl8XS9D7MO9oTQP8TmFAjSfYwd2qSHuRgY
 kUk/c7dizplt4Eh54xnP4fp3lJhZ6wcDgyu6JaY2DYy4rFaO0B+NrRExV2Ix6Y7E7U1m
 jA/xbHxmKwZs4ZK0RwQb6PrTv0Xz3AVUrD028sMX8P2eHTs89bNwlw3fjAjNt5aKXFtk
 6CJw==
X-Gm-Message-State: AO0yUKV9FbIrR5Jyrp3hmIkw6aYYZrD37bRojZ33Z+ISo2xs23ra2qmY
 iXUBIWPWCaC3lwsZ2eVsfx0snKVffd9QLpq4e9yvhA==
X-Google-Smtp-Source: AK7set9VcNeW8wA9kN5fQ0PngHZKVz7izpG3IOPPz2EAUfB9H+7G6DoZBTACeVgpMNBaZGBxNnP5mmyw60L2Yc0CYuc=
X-Received: by 2002:a63:a80c:0:b0:503:a7:d244 with SMTP id
 o12-20020a63a80c000000b0050300a7d244mr823491pgf.9.1677868128146; 
 Fri, 03 Mar 2023 10:28:48 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-74-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-74-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 18:28:36 +0000
Message-ID: <CAFEAcA-xToEB=DtqdBGfR6qLV+9UN+n8vQSS9E4RXqo3xOKZNw@mail.gmail.com>
Subject: Re: [PATCH v2 73/76] include/exec/gen-icount: Drop tcg_temp_free in
 gen_tb_start
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x533.google.com
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
X-List-Received-Date: Fri, 03 Mar 2023 18:28:54 -0000

On Mon, 27 Feb 2023 at 05:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

