Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1puuXO-0007JB-Hg
	for mharc-qemu-riscv@gnu.org; Fri, 05 May 2023 08:27:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuXN-0007Iq-0i
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 08:27:49 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuXL-0002tX-Ec
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 08:27:48 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-50bcae898b2so2977454a12.0
 for <qemu-riscv@nongnu.org>; Fri, 05 May 2023 05:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683289666; x=1685881666;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2F1zis0eSGuvuvC1CHrwppmig0EsQfqxjrY7ags+n+c=;
 b=VWg0emqI7GA8hOcdlTJORLW7q7ml5AUoT8YzS+xp3odTs1/kk330qyHb6UXrNqLNaW
 Hia2NVcVIBi7F2cvkweDALF+LY0nbvHiRXRuJd41VLViA+FR5FP48R3AkD0T9Sw8vQcC
 HrQuj8WwsQPU4ep3vrumByWG+getnTFhodyY94iSTnAxppslQ7o3lg4AmRbyfuxOsuCU
 imp60jRWJxjk9RUqR65Qlcyw2RxHt+auhjDv9FhXnJuigykjQv61L5ql98pWsz/7iEtM
 eMddf9HMHVbpOwmDgqeZ8J4EcNdFG49rEga6I1wY7A1VI3/A2enyVwHuKGwiwj+Xraxu
 TtHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683289666; x=1685881666;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2F1zis0eSGuvuvC1CHrwppmig0EsQfqxjrY7ags+n+c=;
 b=KlbfL8VzfFYAVs8HuDR19ifHhE4t2WiFroUVWV6QKvBDFBrm3iWdhQ290S9v+Fefiv
 f/4AuByBKW5QfXxeGyMRTpNpNW5/2SoeWISrwDgolsA3WW2J7GTsnGDWvimlSmqP6DPh
 80iMnJUFi6IwjdAu898pXo1X079/TMgi16mZB+rbJX15DQxUC7Axry1XL9dNjfyauNQ8
 vg0t0A46PYaw0JP7hzZPCzuumq4yrAt4+a/c6wYyRn+Whvayoo9xTW8wohxfC44RDpyG
 vFKBKQbBv9iQJ8XsdmPVYTzGM7U9qPcX93mJJo8AYFsfHBwWbK+6eC4CqQ8vuuKd5kk/
 9dSQ==
X-Gm-Message-State: AC+VfDxHQCdjUWokXBCXFHfLF8jpDJtH1P9zbPc/G3XJWKDZcKIE0Kcz
 wSlzrlEhfJymMOrLdEFkUDmPy0YSGGg9q+z/c1lneEJMIf2By5sW
X-Google-Smtp-Source: ACHHUZ4CPwXHGQHw1YQmV+egFfvAIeQOYJkgJwIPzr9Q4L19mFC/zrzUmYsdJPwEgMGiG9K+BXojCpwSUHabNt4DLfY=
X-Received: by 2002:aa7:da55:0:b0:50b:c780:2581 with SMTP id
 w21-20020aa7da55000000b0050bc7802581mr1184503eds.5.1683289666062; Fri, 05 May
 2023 05:27:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-36-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-36-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 13:27:35 +0100
Message-ID: <CAFEAcA_Xw_EHn+dbm5-Uc9NnZwb3F_P5sPZz2uG4yVg5UTX+Hg@mail.gmail.com>
Subject: Re: [PATCH v4 35/57] accel/tcg: Remove helper_unaligned_{ld,st}
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Fri, 05 May 2023 12:27:49 -0000

On Wed, 3 May 2023 at 08:19, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These functions are now unused.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

