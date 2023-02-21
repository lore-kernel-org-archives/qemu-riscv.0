Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pUWk7-0004Hs-N7
	for mharc-qemu-riscv@gnu.org; Tue, 21 Feb 2023 12:47:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUWk6-0004HT-Jd
 for qemu-riscv@nongnu.org; Tue, 21 Feb 2023 12:47:54 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUWk5-0004mz-5p
 for qemu-riscv@nongnu.org; Tue, 21 Feb 2023 12:47:54 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 nt5-20020a17090b248500b00237161e33f4so3623649pjb.4
 for <qemu-riscv@nongnu.org>; Tue, 21 Feb 2023 09:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8wa3cXOe8DQ5zdgwL8rAxctHQW3nFEC3AB3I9alARfc=;
 b=JG6STRWdrjjK+kWHfI/B3w3d80wBSLa6WFUOBGUU3W1+8oLAOlNm9OzqZoFEGPqzG5
 zU9Myt6W7doU8Mz23z291SQST66f7iv1m/awW1b8cfzbQn7TsRe2pgOplvVX4W2ayAi7
 GAxO17HsntqMNBQjxwcVcmwuFv2MvyiqKnAma3dZnYOIR2x4bfxlx4gxG9fAPYJGB5Dp
 k9eUdVn/zXgj4IgpbzolOpq8K1zYAQ6t882uYdcA35nCxeVu987oK7wjThTCjLA8rnYD
 TH/EZWtgu8mBCJjDOANzc/CarlgrUyfA8CJysopdvc36CNMouL5o0qnPod/0mCHKZV9k
 D0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8wa3cXOe8DQ5zdgwL8rAxctHQW3nFEC3AB3I9alARfc=;
 b=ePnhzMAOY1eu1urLmlqRv7q/gxBvMGmMO6xQNIrq9X5ZAsqCoKAC9nKnzT5kR6hpAh
 GAKkJjD4/fJ+trv+C/97lvtusPNJsBZnkjTPSLWsinkfdkoK9alXdMqXmb2qZsHKRiCs
 AsUHbJgbcwsoQ2nFE2M3jFzsTYObfO6Fjai4HUXWKFPURsTGSX4HQf03qxnRsNq45GMj
 cXluAdgY3CyPP9IegYnA4eIyNt8rlz/kCEyfDsGKWB2LUAg+R0CsPy/0MybEEGvVYnlw
 uyrl3IDUXTt7DKk2nVART7XG2X5190xkSP/deyv03owPqs367duKpI6esLz4DEWIQ+E9
 IWvg==
X-Gm-Message-State: AO0yUKUzFUxL9PN7u80vrrSVG+I4jvUSAu3DAwcy5h0JM3i9YKgT9+5R
 lyn+DtXKV6cpwFqC/+b0Fm+mHGjUbA6m1YkCCjJY0A==
X-Google-Smtp-Source: AK7set8Dn9NP8sx+CyphqMBiH1844tAapgjYYaOl64zs90/5hdQHb9b2NFW4qcLzMCbkvQd1hBFc5q5Dz2xne1CTYGM=
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr1940898pjb.92.1677001671261; Tue, 21
 Feb 2023 09:47:51 -0800 (PST)
MIME-Version: 1.0
References: <20230216142338.82982-1-philmd@linaro.org>
 <20230216142338.82982-2-philmd@linaro.org>
In-Reply-To: <20230216142338.82982-2-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Feb 2023 17:47:40 +0000
Message-ID: <CAFEAcA-Ju7G02yfGEmJmP=N2Eu0z5Q2UJ+AiLqvkwmLs3wcaBQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] hw/cpu: Extend CPUState::cluster_index documentation
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Dapeng Mi <dapeng1.mi@intel.com>, Sean Christopherson <seanjc@google.com>, 
 Bin Meng <bin.meng@windriver.com>,
 Zhuocheng Ding <zhuocheng.ding@intel.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Zhenyu Wang <zhenyu.z.wang@intel.com>, qemu-riscv@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Zhao Liu <zhao1.liu@intel.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Robert Hoo <robert.hu@linux.intel.com>, 
 Yanan Wang <wangyanan55@huawei.com>, qemu-arm@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>, Like Xu <like.xu.linux@gmail.com>, 
 Alistair Francis <alistair@alistair23.me>, Zhao Liu <zhao1.liu@linux.intel.com>,
 Eduardo Habkost <eduardo@habkost.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102a.google.com
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
X-List-Received-Date: Tue, 21 Feb 2023 17:47:54 -0000

On Thu, 16 Feb 2023 at 14:23, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Copy part of the description of commit f7b78602fd ("accel/tcg:
> Add cluster number to TCG TB hash") in tcg_cpu_init_cflags(),
> improving a bit CPUState::cluster_index documentation.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

