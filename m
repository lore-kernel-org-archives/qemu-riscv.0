Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pYAln-0001pm-0X
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 14:08:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAll-0001ov-BO
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 14:08:41 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAlj-0008H5-HV
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 14:08:40 -0500
Received: by mail-pf1-x431.google.com with SMTP id fa28so2191674pfb.12
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 11:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677870518;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bM1g0LIyk5Cld/C2bL730fbqF1SCuPlRTB0UtNcPydo=;
 b=G8w0OrEut8qOFQSbXzCmEaySTF+JY2J+92rMagNbOncY1KOhyCNFK29YEZTvClq0MB
 Trsd2Q5sGL7dOWzKsW5QWLfwDDCv1cmtmdWr57RstLl/yCgN8vMMEOOT6JXAH6vuI4av
 xkxYob4bf5xxNshRcE5g3X+c/slQNXaiNsXFdwQpUpjCh2I7yBnTupri6YxPhiymNGcz
 wmjwClRDaxmN+ZaW/DGKhQEmFsvRMSujDNScoE1y0xnJj8J4DpbQi5vpcFDsxgZ4uWUh
 7gW/XOEsXawnGvZ/YPKOD8D9h12a1BVzGGP8NhKJIHpz2SH00KNLIQX3ZW7AWpsJSRB3
 83FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677870518;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bM1g0LIyk5Cld/C2bL730fbqF1SCuPlRTB0UtNcPydo=;
 b=zjL4kvaGYO4P2a1EK7RuvC1rtcvi6nlzV0O26Ho1TQCSff/uaJ5b+K7G+919U7rIoi
 6uXNlRsOhlYcPDVodrS/Vnz9OS5y6xW/X0O8bAFR7lI2afmEBFd1h6S6Ck++C8o0Uagl
 NgeUjpLnZwaeZrLfU72KC6956MkcVWQFccFG1821BkuIV57DaHH462ZK6Cmg92GG6tgJ
 UfvJwd5Ay+QVmuHsxNvIGnXxpZ6IrBzCJDBxo+YkjSXzKOR4hYgTNuEcNgT6/+OZNl1j
 BCGAht6BX+z2jyrOCKt6ET8Wjsuq7Bc3lI6kA2YFFyw8SOs4PbqGOQFeEk83piH6E7iO
 eKkw==
X-Gm-Message-State: AO0yUKUtli2M16Grza6X0JEf5smHCjhN5RHGCLsJfmaU70brFVxdiv0S
 OF/cUI9l9dUHEzJ/Awocl0WPiHLgZHRtdLlNWnpJhQ==
X-Google-Smtp-Source: AK7set/w8xcLzZUoECso1cR1eLlbE6fwoY9BEPZOyLPtEHUXo7hHC5zWlGoeaVIZmwmSe3pJYAKzCEwDNPl4D+3HiOo=
X-Received: by 2002:a63:2918:0:b0:503:77c9:45aa with SMTP id
 bt24-20020a632918000000b0050377c945aamr827092pgb.9.1677870518079; Fri, 03 Mar
 2023 11:08:38 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-70-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-70-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 19:08:27 +0000
Message-ID: <CAFEAcA_3FEKE7w3jh3EQYcxGM3A1jX0Q=Tg7UsE3f41bY1tMNA@mail.gmail.com>
Subject: Re: [PATCH v2 69/76] target/sparc: Drop tcg_temp_free
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x431.google.com
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
X-List-Received-Date: Fri, 03 Mar 2023 19:08:41 -0000

On Mon, 27 Feb 2023 at 05:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/sparc/translate.c | 136 ---------------------------------------
>  1 file changed, 136 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

