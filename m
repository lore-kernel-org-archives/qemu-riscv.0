Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVr1e-0001px-Gc
	for mharc-qemu-riscv@gnu.org; Sat, 25 Feb 2023 04:39:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1pVr1c-0001ou-OX; Sat, 25 Feb 2023 04:39:28 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1pVr1b-0004Ik-0j; Sat, 25 Feb 2023 04:39:28 -0500
Received: by mail-pl1-x62c.google.com with SMTP id n6so526275plf.5;
 Sat, 25 Feb 2023 01:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UWweWqgTlzg6lQ9hIdt/Y4EAsDyF7ZAeuN0el3jcy+c=;
 b=V2R/0FGiZCWqecEaLaMQ6FTz3zuSRTGlAO0DlwNs0DyKd5ZSrDh2mv5X0A4pO3fEP1
 GcqdCoOpRN7gHil5YF1FifQvfVzJ6VnRF7kGSqpw+r8S725L0Ru2eV6clcX+buadXg/5
 KQWp7L5W7wMNhkkUIy0UTrgjFpsSfm9bJ5ud+3X00p9Nod4GPMqALqwynqpYUeRyAQ80
 C+hen9IDSam0mV/zJg5XoImutPgUUIi+3ECFmxGCUry/fKJZwnsZKQ/yEEpJP7vLuWTv
 xxfvCHA6d7P0IGQKZUwMeHvfNW5Kxvtn8757yBS5HphTxg4rH38lFyrfT6unpSi+F/4t
 tr6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UWweWqgTlzg6lQ9hIdt/Y4EAsDyF7ZAeuN0el3jcy+c=;
 b=FtEM1AzlUzqQ533dPXUHYOSNtX5nYFVqVA5DIiKptZa9MMbrAOd4zTeF3h+iA/LOy7
 kUvazQKPTlAw8qQcD+CfOTUMfcIymlLHPLFLAsXghs16gkRW5deCgn0I2pD5heZICq7t
 eFbDSdts3rfkAu36eIpJlpFxZIm9/49Gt+B0vL4UJUxL/1NFPzpoIjRIooUNjLd+vn0T
 QJoiddkboDpoPz9M6ROBxSZD9ieDfS4QS7YUMzT1KTVN2W3Rk6yfhyod6h/0G1LIORmO
 i2vdJBVQNLE17xCBbUbYBXZzVxfel9lrTFH5IzhVIXCNr7fQEoJFdkyZzvmovdLbIoNs
 Jr0g==
X-Gm-Message-State: AO0yUKVdX7dXT9qi0H61p1cCExDkhJgrsZr7DH+5fYdJMUwrNmznl/Ex
 Ml+VB6T+rrPBjwUAShCtMf9p91ekHOv3BcSgz80=
X-Google-Smtp-Source: AK7set9ZzKSF4PEb1PQmWCzFqIgnnvtJKXYKzu45g8p4Yl/FiikAj7evs0ZnmWnRNo97gBt6ne/LOF71Lyc6Id6f1os=
X-Received: by 2002:a17:90a:8a0f:b0:236:67f4:e575 with SMTP id
 w15-20020a17090a8a0f00b0023667f4e575mr1977874pjn.3.1677317963299; Sat, 25 Feb
 2023 01:39:23 -0800 (PST)
MIME-Version: 1.0
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
 <20230225091427.1817156-72-richard.henderson@linaro.org>
In-Reply-To: <20230225091427.1817156-72-richard.henderson@linaro.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sat, 25 Feb 2023 01:39:11 -0800
Message-ID: <CAMo8Bf+vJupWz08e9xSf7+yMTQUebqAaqR2Pryg50_u5RQ+o8A@mail.gmail.com>
Subject: Re: [PATCH 71/76] target/sparc: Drop reset_sar_tracker
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, kbastian@mail.uni-paderborn.de, 
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com, 
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sat, 25 Feb 2023 09:39:29 -0000

On Sat, Feb 25, 2023 at 1:20=E2=80=AFAM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
> Remove sar_m32_allocated, as sar_m32 non-null is equivalent.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/xtensa/translate.c | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)

There should be 'target/xtensa' in the subject.
Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

--=20
Thanks.
-- Max

