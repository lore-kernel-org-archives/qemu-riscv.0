Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pY9Aa-0003kc-Uk
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 12:26:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9AZ-0003dD-TF
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 12:26:11 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9AX-0006IT-56
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 12:26:11 -0500
Received: by mail-pl1-x630.google.com with SMTP id i10so3382204plr.9
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 09:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677864367;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=S9uqBI1Zh26IHskMoPNGumsZsFAQbQinLDpFlF6Dp0I=;
 b=d38dpnrs8WqNkins1f1QJfqvfcaUlzagzrHZK99psbsHrU1usZWagONjDa/vCx+vrI
 Z3qpWJVYY3AQn38XwcoN/khEyY2B+8hJXcTGOccalhlpR5GbTcIr0qysdk34py5yEzHR
 yjkMw+bYmX4+sQOT5Hs7gRpbEyHN4UbSy+QlKPw0uWbSvPRIFOXWlEuxoxmPQkVIYXDR
 YZAk26vkAjOG1ETA2I+KtU0Dtag6UNe2IqmHJYMH2I82Vh3X0TYoqRRP8L/pBkL2g+Iv
 VtH9QRsLicTBXpbwLWGE6RlXDRTAV7/kzCKrx08WJJOhxLwoldxlldGWeuNuo1OOrWB2
 7UYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677864367;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S9uqBI1Zh26IHskMoPNGumsZsFAQbQinLDpFlF6Dp0I=;
 b=u+Ew22YzSTjgNEWd/c9LVq8RyCaA6ngLAL1G5EGIpzlDusKy+cJAJgczq/SC/YlhnF
 7xuc5SBC9mBEQRrqY6C9K33wHm6r0EDbE90xBdLCYsVPWU3j+rKk6tZiqAg/w8ESGRG+
 NzL9x2aibckRLvBqBD/AhuRmg/yV6qCz1y1UZTGFIZ7cSkmXK/xV8DvjA97CGhHOHdsB
 XqEWABkNhd3PXpVYZ1wyBz3RATrPXjMKzK8AG4Sz0tcOY2iVu4jivs+BxKlzUKJsOhn/
 DwHihkBP/xSVnAGeLoKpTHleZWJdI7cE4Jux6OS+KtBC1redWnQCu/9lLOkfw7d9K7L+
 A1LA==
X-Gm-Message-State: AO0yUKU+GQ5nxPkiSzMRS7zQ81D0IE+Ff/FAGTXqPY0JgWPfKwaAa2Ks
 PNF4yl8YvOob+WVHd6El8y9xWPzAOLOfttICgr3bUw==
X-Google-Smtp-Source: AK7set9TIjiluVUzQQTFuowHaN6khgCIOpsh96YtGZrkLXaHfRzJ2jmkYgtKgjKdIe5In6ubQKFqIlUJTx6II/Evbm4=
X-Received: by 2002:a17:903:2581:b0:19a:8bc7:d814 with SMTP id
 jb1-20020a170903258100b0019a8bc7d814mr959880plb.13.1677864367594; Fri, 03 Mar
 2023 09:26:07 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-3-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 17:25:56 +0000
Message-ID: <CAFEAcA-LviR-aaG7XvmMOUXY8xhcZY-u6vUaFjDMr=C-UBPJxw@mail.gmail.com>
Subject: Re: [PATCH v2 02/76] accel/tcg: Remove translator_loop_temp_check
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x630.google.com
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
X-List-Received-Date: Fri, 03 Mar 2023 17:26:12 -0000

On Mon, 27 Feb 2023 at 05:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Finish removing tcg temp free accounting interfaces.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

