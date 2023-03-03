Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pY9IU-0007NW-Jn
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 12:34:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9IP-0007LP-KW
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 12:34:20 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9IN-0000Mj-CC
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 12:34:17 -0500
Received: by mail-pf1-x42d.google.com with SMTP id fd25so2069115pfb.1
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 09:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677864854;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+08/rGcbX4gYG9RNH9XyCmG10A20EblO6DeLZdgzWaY=;
 b=a+TIVkub8AKKDpijee6t5oYcCSms4AZsDNzJRr6ftlAKGJ0pQXkhq+vohmzxyNNwOl
 wzLb+YuV5xDbBjakuX9F+PiBSJDYFP8VG4pgXqQHQFO3SReEpLXOrSJ6Bgovk9Gcmi3s
 xGKtvCm/XtMnpjoYJLLnyeXjPNd1gUzIj+Rq/Qt/UkwvKLYUY6SudTXJWV2aLbrqQyjr
 N1N+HJdb/905RjtTPojI548kl+RB3D0xU8BsawqdvNnaE3kilPGqAnLxkgz+R2wLGAw3
 4JtikUh7Ibpj24+/uEYS8jLF8y6iaoIX4t5gWBuXTg2qoj1z04MsGR00H9ZhwfgkVr8M
 b+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677864854;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+08/rGcbX4gYG9RNH9XyCmG10A20EblO6DeLZdgzWaY=;
 b=LtKacfUvuijAMlz2TUhS5AZDaoECeG5EHcKfzT7sxkIgvUiVxps7N5K4/71+WHnzBm
 8yaW+L946+7axr1TjwReF+pIEsQ6WEGbpkyFAW575rxsNKrAKapq4TEI5MR+ggiPEx/a
 aSYAupMFRB7vh0CbkV91naeiKMoQNTwcZIxaSs6OEtZb3Ru8dl9ObcngPi6tahe2938k
 rt4Q0w1aB6ipy+tfuuB6FKVk0+dCjx1J+Hwq1O3xqLLF6kSulKvEcQpcHKVem6o3ODqA
 lAj1iK44VmpOALDDNz+1Y8YaAXPxjD6J4HNv9F1nG6B3oK76ZMQs/VIWsFj7TkO92q43
 5Etw==
X-Gm-Message-State: AO0yUKUNI9/KCX8tTXtymxEC91Quk9clE0hSASS8cMqq0SwU0PHnZHaY
 4xwAqLK+R0WoNw7rN/Kq+c3cHJMuqonx2pIezp/ZuQ==
X-Google-Smtp-Source: AK7set/54M4Pq+CGRDivqX68nAc1p5hiAOeoTMyE4JpdEf93gxRbS20yD3645iE6k1L852AKM5Ak+xmcKp99trAa0IY=
X-Received: by 2002:a63:2918:0:b0:503:77c9:45aa with SMTP id
 bt24-20020a632918000000b0050377c945aamr735029pgb.9.1677864853915; Fri, 03 Mar
 2023 09:34:13 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-10-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 17:34:02 +0000
Message-ID: <CAFEAcA-nW8yfRSAZQ7xayTyDRJz7Znt5gd8cjwGbNXrai58EEQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/76] target/arm: Drop new_tmp_a64_zero
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42d.google.com
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
X-List-Received-Date: Fri, 03 Mar 2023 17:34:21 -0000

On Mon, 27 Feb 2023 at 05:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Only the use within cpu_reg requires a writable temp,
> so inline new_tmp_a64_zero there.  All other uses are
> fine with a constant temp, so use tcg_constant_i64(0).
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

