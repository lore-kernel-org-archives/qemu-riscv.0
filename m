Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pYANi-0001dw-0x
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 13:43:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYANg-0001cs-Kp
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 13:43:48 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYANe-0007Zh-4I
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 13:43:48 -0500
Received: by mail-pf1-x435.google.com with SMTP id bd34so2184503pfb.3
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 10:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677869024;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sJweuKjisjl+SbzQFRrcKt2u4A0ARVkM5ctNmHfdZMM=;
 b=gb8Voo44eokQnpyXZRZCHk+6pesmO1ToYDWW03UdcbkJOSHq9wBdNgcSxL/QeddE4k
 tGXEZksal3WhDASLhfBNgUewE0guedOwuBCt8mmFAK5JPeb0tdCGYFb+r+GUnoF6xo9L
 zGUI0YBctuNI32CFePwoRhTI9IcX15up5bssbtFyYHGHUVqFCJxHWNw4y8GrTE2Ynma3
 3PyTqrmP/uNqaky2u62dAaPjKaMQHoSx96zySnYFFD8Wbx0WNM4W9kLHAoXpYW5xFPcg
 dFzmcteb39w3phpoE7sX9u7bZ8E2dEKzEEv39z+e7HvbRefwn2JiUgJiBLUwWEGkRcGC
 liTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677869024;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sJweuKjisjl+SbzQFRrcKt2u4A0ARVkM5ctNmHfdZMM=;
 b=IGEgG03fkVyNzUYni2XrcZ7g5APcLum/qY9lgtog/18bfNzAEASfZ25dYEumTLR9VD
 kqy4OVK56uM/k+co448UhkWl3xLWO0yKcpfp4Uetg5zM2JXFi4RqfGtfpwIshxmlGgyD
 7KmL1nEkhwqCczjo2rb5DBXX0kJAYg20yEIInDaf4XFTuK7RNDbCT3a5vAanyDba6uyT
 q8Fsw/KptFAgTufD5Py/No5cBhHTa0KF6ODmgA9OpEF6vK4FfPJwmPEihYyUbPH8FbUJ
 8UPkBci5jmjVIx5sZpmUXZVtGSMaCTr40MIolUlJMIvn8hb8r875MRm1EtaMeKSwATjE
 jqsg==
X-Gm-Message-State: AO0yUKV27ZFpv+uAS9NbRh6yEDubk34TbCUSKuIgTZR0R4MfLmAzWyxZ
 kd4TfEg7WHiEqRtvwETY8OOxEpUZLIrtY/CHVmzw1w==
X-Google-Smtp-Source: AK7set8GrwjCFRwaCzpdpX2mAwBm3/e1o8SqsHKF4VDuaKrObWw9CHCHt8w7Rm44F7V8Fb0roZZxiROt5PUnmYl9bw4=
X-Received: by 2002:a62:d041:0:b0:592:41a:1054 with SMTP id
 p62-20020a62d041000000b00592041a1054mr1314109pfg.5.1677869024519; Fri, 03 Mar
 2023 10:43:44 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-19-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-19-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 18:43:33 +0000
Message-ID: <CAFEAcA_7WuicoDqMBvjZN4WG5h9k0h4f7oyJ5vxvbjF7O260dA@mail.gmail.com>
Subject: Re: [PATCH v2 18/76] target/avr: Drop DisasContext.free_skip_var0
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x435.google.com
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
X-List-Received-Date: Fri, 03 Mar 2023 18:43:48 -0000

On Mon, 27 Feb 2023 at 05:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries,
> therefore there's no need to record for later freeing.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

