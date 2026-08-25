Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D03C5DF94
	for <qemu-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 08:54:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wymuy-0003Z6-5e; Tue, 25 Aug 2026 04:54:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1wymux-0003YM-0f
 for qemu-riscv@nongnu.org; Tue, 25 Aug 2026 04:54:03 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1wymuu-0001ki-QQ
 for qemu-riscv@nongnu.org; Tue, 25 Aug 2026 04:54:02 -0400
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-93695893ac1so268444485a.0
 for <qemu-riscv@nongnu.org>; Tue, 25 Aug 2026 01:54:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787648039; cv=none;
 d=google.com; s=arc-20260327;
 b=hDJ9QFlAjjVqnGOsuVgP4ihdYACUBCgJrmOb8xJAGHAC4KxOEgdIiTdwt7wGQXvd5d
 rBfJzSLX9CRTOmejBHjEFuqH7X89SGFy6JkwrmaNLMNQd+K7F+ftTfKQfhO2lfOTT1Ug
 zq3Se6RqNXWKLTPuTMQPePq1FxYDoGUy3uhvhaeligMrIKyeHfxcik9w4gwKspBvSJZP
 bpS09tIRbodsw4h40c42YYgUSBn2ASM7ZW6icOZ2MgSBjo4SOMz6XnV8LcdO1S+i679K
 W7fdsrwWgExjHkRKh8MQeXQbtqbp85jWJ8VRuAHNKJfP7+TmPBAywZDTkSM/5+S4w5LT
 M2Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=IxATitYurc8EbXYI2BSj9Hs3kEcBruMDQ56bb7ZIbcg=;
 fh=GmhAFJD7zA8Zl1/Dt02z8FNGRIFMNeY8AhDTK77tDcg=;
 b=bEyJ2Pve4WfDMax1hl3DzZ61vG9HYPzYyj/l4R1425FXgRfd1N/hLCsBHdgqSumeMx
 LSqXcQvLfdtxAvc7nMJDqeos/YWPOr2/eK0rwM1l8BNZh8PoVzh7XvjqtexL1q5BTXR0
 c2HW2pRgkVBNQByqCkrZG4mZ1U4YRKD02uFhEVA/9uqhAvClj29DuzY49k76F9bPgjdX
 Qf0aX06TliLzp89ybqvISi+CsW22dtfiNgvHZbxKB85mAN05ANvomfsAmNwEkQoBJOnz
 Q10v2k2M0frdTjlO+Jhh3ZoUs6PWc9JU4pQjJqaFwvHitr4FkiqDO/kEP0WpBiXVv2zb
 VKHw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787648039; x=1788252839; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=IxATitYurc8EbXYI2BSj9Hs3kEcBruMDQ56bb7ZIbcg=;
 b=AFyq+X6RZmIcRuxrROboRrqv2KFoTUZWAaDeTnYk7RYWKogNzohIynNze0Howa7oJc
 wdU03bDSRwaESW3iyIorvznlu3DpqmDVLJQX73Q3xAMU2UEkHKNLgk9uJY+L9kQL4w6t
 IBIygnJTv/cfTgdx0b+7mDO1AeJo60J2Efq3cZX+GeovwdxWNKdwiv38WHyfDDnXRPez
 vd9kE7yhvfBUnR1wOW2rY4udSbpurfxkwNoAjV6zLDg0S9rYIksIWzldYegdazMYq3MJ
 7yo8KXSP0gJB7nIqL638sWfU+cUHU5nkCU0UFDfsi+R52smt3CSBPfuCO2PhX2N/98Z8
 QBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787648039; x=1788252839;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=IxATitYurc8EbXYI2BSj9Hs3kEcBruMDQ56bb7ZIbcg=;
 b=ceFQvTaYuvhdM+KIQdhy6QXaZPDVHvnIz1vB3ws1sqYRvYm5GUAg1MhBtXxWoxPNLo
 EfeQYHJGnNdG7ZQcq9BqfjKECq2mFMT7Y90Et1Y7mvD5psi9Tu/I2QRhKRK2vtXw02Ql
 qQ/wVUKUrKnbUexmzPpsRKYGSBNNDRcRjXEm4t4rou6oMD2brgb4+Cf+jE3XlshZF1WY
 Hoea9RwpmLMCzCuh95WfncGBwyb/+Libs/nbQcbeaFuXnWToxf2KwueiKurm4G8GbCpB
 COSFywKc1BhAGfiuxQ7kFNDk0Jrrap05MXTxf/OoJOOCl59vCXS3YhZyzj8I1J2lA9tb
 FXMg==
X-Forwarded-Encrypted: i=1;
 AHgh+RrUeE7JaJWI6AylUgzg35+rzEnLDfy9d1I1h/Nmdjt10UVcho+tAsxx1JD4coDiOZnNR4NBHbH8j6MU@nongnu.org
X-Gm-Message-State: AFuF++ns57+qbwQAo2ToDZ6U2kAoieU89OHCLIFrtwykiJeQwV73jqSI
 Y+7lbeTVq00rY/9DKLbycJBe0/apBFN4mKTViYnxzXsDFJIyMgKqKk8Q443+GljwjPf9Bjaq5pB
 kw8voboq5RYok7/cJ7ra54TqiJQytGnU=
X-Gm-Gg: AR+sD11LqHIqjNLpEhg9oXp37Jo+KYmcolSoGv5DrHGLGkhJHtPXW1xxEuZ1eKNDuAt
 9Wf9tnL51ZrcH0FU1FykxDp5wzT8oD8oyXvvZN35vri5ft7RuUrGMCS3mGt43PjDezK1F7oOgVX
 Wn+KBenecUg4jXYaMIUXZkF6GQ1UC3ByV0Eykqhtb+/mG/ov+WGCIRAwfqCN6T4VHlmz/7bFRhr
 +cZjuwYEHcJs9XNoA7gzn3hPx4JlB9Oin8KhCMS7x0xNgNotvCdniMa/tHVvXuv+MgF0KgIJDzb
 r3HPA876F+ygc7qxYQPCMDQ/pgn116WftK0wIDrpgF8tgCoKPNhlLUiukw4gWz3dn54Ps9xvFPN
 9sxerjgvYZ21iozmkCJWn1tS3qSZHL9EMe75lvsCm5BebpQRYXP7Jo5tCFLDm+NE=
X-Received: by 2002:a05:620a:1a1d:b0:937:6771:e7e7 with SMTP id
 af79cd13be357-9376771e8damr829132685a.30.1787648039244; Tue, 25 Aug 2026
 01:53:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260824111711.26297-1-philmd@oss.qualcomm.com>
 <20260824111711.26297-19-philmd@oss.qualcomm.com>
In-Reply-To: <20260824111711.26297-19-philmd@oss.qualcomm.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 25 Aug 2026 01:53:47 -0700
X-Gm-Features: AcwNN1WEwK2DUZH45Zj_m2ROUpqkMXxheouHHKZZ_3nAzeD16f7z7iGe_QZUvgg
Message-ID: <CAMo8BfL88QP4WCRc_X3AXHZNjXp5L_6W1spUpZg06vQjR_fceg@mail.gmail.com>
Subject: Re: [PATCH v4 18/20] target/xtensa: Constify CPUXtensaState in
 xtensa_replicate_windowstart()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-qk1-x72c.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.004, HK_RANDOM_FROM=0.999,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Mon, Aug 24, 2026 at 4:20=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> Add the const qualifier to CPUXtensaState when the
> argument is accessed without modification.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>
> ---
>  target/xtensa/cpu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

> diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
> index 442e98bd1ba..49d6ad9083d 100644
> --- a/target/xtensa/cpu.h
> +++ b/target/xtensa/cpu.h
> @@ -708,7 +708,7 @@ void xtensa_set_abi_call0(void);
>  bool xtensa_abi_call0(void);
>  #endif
>
> -static inline uint32_t xtensa_replicate_windowstart(CPUXtensaState *env)
> +static inline uint32_t xtensa_replicate_windowstart(const CPUXtensaState=
 *env)
>  {
>      return env->sregs[WINDOW_START] |
>          (env->sregs[WINDOW_START] << env->config->nareg / 4);
> --
> 2.53.0
>

--=20
Thanks.
-- Max

