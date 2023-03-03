Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pY9C9-0001ko-Ei
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 12:27:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9C7-0001dm-E5
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 12:27:47 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9C4-0006aQ-Ae
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 12:27:47 -0500
Received: by mail-pg1-x532.google.com with SMTP id s17so1932038pgv.4
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 09:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677864463;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8LO3H0xihPu/J7zCAeMi7XJn5vVG/43m/HalvuEQr3o=;
 b=dqe9Wr/0rmE64Xh4Yh88Z3e9cpBEwQtvyuIgUVKevqct1CNJD97nClsdlKWVWM5bqL
 AMy2A3k3BhQTXw8Xd/mcdQZmkedJIPma18eTQITDXR2UrL/++lwc3xrn3xjv8fVQSJQl
 PGfz2yV4R+7+xqFLNpHCCK6YwTcMe+q7Np4Ul7XqQRmgjiBkDaYAycIIb0EcoP2tNC9F
 zKTDZj5OFsX+8cJJ6Dz9hFHL8nyEjfxnFSHCiKEakc6u0f6Rfu/sGwaKWIC+e2FFzGnL
 pXYoM90xKp7I5rZ1qNXNbhkFwxfN1wZJqRrQxO5JfIpvV9V3E6rHFfe9GL/m3HhuhWrO
 Zj2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677864463;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8LO3H0xihPu/J7zCAeMi7XJn5vVG/43m/HalvuEQr3o=;
 b=QauJkizsXsoDMVu6GJwnOsmiX8LesU7KtjPTPdcM09cw4b2YFlk8z8H+/DIRW5HYfP
 MYiSuHSCNTpoSGOKclNqdnEr99t9zyWnlN0KCAB04A/OGkV5gY79bitMi0clO/SiEDGl
 IavNX+E2SwWCtxHkAgFWaoXyZD8J8HePcfgB3Wqj9Bz8IJvUd5IyIomRJ6M2rs6BlnCW
 kmRUmo770Xqr+FU51XxAKP0lxTdKTsrC/US82O12nwwCT51yeMHB3w9ziX+Y9QFGuotf
 /TngmWnn0PR0RTV+bBBOHKGV6YVFwfs5JoFrZbMcq4TC0JbqrJjl/E/XxGa29UZomVsO
 cWlQ==
X-Gm-Message-State: AO0yUKX3G+jnasLajLSFe7D9N5vART0NAJikM7hKYh2PQ4tBme0dWOUh
 nQmAGQDMMTwlKKa0ADAO9R/SgYMBOYVUb4AUZRa5eg==
X-Google-Smtp-Source: AK7set8RtgODdpxMw0WfgMvh8Pc/ic98gX8Ayo6k4GS8+spLKyKEnHqUHKrKYeujhwqLaNk7opMzTRtE8tnRzPzCNoc=
X-Received: by 2002:a62:ce4e:0:b0:5a9:c22e:7764 with SMTP id
 y75-20020a62ce4e000000b005a9c22e7764mr1200776pfg.5.1677864462740; Fri, 03 Mar
 2023 09:27:42 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-4-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 17:27:31 +0000
Message-ID: <CAFEAcA9S1kr8rJwgM=qxoSouBhQ+q_cHoUVmZLFBtuTd3YqHGA@mail.gmail.com>
Subject: Re: [PATCH v2 03/76] target/alpha: Drop tcg_temp_free
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x532.google.com
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
X-List-Received-Date: Fri, 03 Mar 2023 17:27:47 -0000

On Mon, 27 Feb 2023 at 05:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

