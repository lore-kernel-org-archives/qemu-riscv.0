Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFO1a-0004s6-JP
	for mharc-qemu-riscv@gnu.org; Tue, 10 Jan 2023 18:27:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFO1U-0004qY-Hv
 for qemu-riscv@nongnu.org; Tue, 10 Jan 2023 18:27:20 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFO1S-0000pi-Gu
 for qemu-riscv@nongnu.org; Tue, 10 Jan 2023 18:27:15 -0500
Received: by mail-wr1-x432.google.com with SMTP id bs20so13369291wrb.3
 for <qemu-riscv@nongnu.org>; Tue, 10 Jan 2023 15:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kvrsJvfbUsBCxqa2uMY/F1Ahi9mgZXKLdGclMUIO8og=;
 b=Eshk1hJHbWV7L+d3dcVJz6imBnhLV3nGkcMACO7Ww1q0deM14n+uJN5Tc64YFwdRXx
 39Q5fMlCKxraRjMJhMTnCj5bDc2gYoDfDQpXl+LMkJnwh+2ExlUhivPUb1BGzX8BswxB
 +oyUsGkdDKeVuNZJCruUzmzFFxT758pJGVfdkZrQgqIwtvDzZgArvCh1V6Kp1ivEO73q
 hPmHrQzpSqTb4vbmxssNGAH2+yAf29/xAyM6DvaDEvCsHcVFIEzO6bPbB+BWAcfyvPWz
 1I+9IJ4HQeRaHQp2vKrWTafmn786CkKN+r8hOMAdOHD+VestWJIfyNiRnx3rlsdS62+G
 SaCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=kvrsJvfbUsBCxqa2uMY/F1Ahi9mgZXKLdGclMUIO8og=;
 b=L77kEon9E5JVdUEc6Mxjjjjf4v/Hr4Y6v+Q+tiDARmS8vBTtMKbagzr8kleSPKRBOH
 Rs+Yy8jd3tjHIATaAxgi0MOcLr5dq5h9V+bc5SaEQAu4kbAa09/1r+c4AdpNfj1sDXzu
 AMUF2RmHhfAJHaAJtF1/bdPOAan/ld6XY8ICSgBQZAxojtA36yFX8f/NwArUsaMISwp4
 1jwMcZAmVsGoFtMS15Uu+AYfAJtAQpnLJpKU+M9AFwZj2tg0JAuKv3yRWXOGDCO6LLLI
 4cAZP9gu9fBpMUJbXtMEQrvAVOdgXd0Gr3TwYZGo3AV+PSzVLU3dRoTFlVgJwasHr6QE
 BtgA==
X-Gm-Message-State: AFqh2koDf17myqA9B2BeEAk+S0pvwu7MYjxi6Z3BqpqgPiC9ea5lyl46
 Px4nxzEWbaTSGZTwhhA7iAztoQ==
X-Google-Smtp-Source: AMrXdXuKvtADrUD+fH9EgS/XnoMZ32xcyTYjZ6y4y1/762H7T6IpJEeDngsc/zjgYQ2yxXty/JQkZQ==
X-Received: by 2002:a5d:5c0d:0:b0:242:1809:7e13 with SMTP id
 cc13-20020a5d5c0d000000b0024218097e13mr54419945wrb.11.1673393231887; 
 Tue, 10 Jan 2023 15:27:11 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 i2-20020adfdec2000000b002b9b9445149sm14528493wrn.54.2023.01.10.15.27.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 15:27:11 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E441B1FFB7;
 Tue, 10 Jan 2023 23:27:10 +0000 (GMT)
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
 <20230108023719.2466341-2-richard.henderson@linaro.org>
User-agent: mu4e 1.9.12; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v4 01/36] tcg: Define TCG_TYPE_I128 and related helper
 macros
Date: Tue, 10 Jan 2023 23:27:05 +0000
In-reply-to: <20230108023719.2466341-2-richard.henderson@linaro.org>
Message-ID: <878riam0mp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 10 Jan 2023 23:27:20 -0000


Richard Henderson <richard.henderson@linaro.org> writes:

> Begin staging in support for TCGv_i128 with Int128.
> Define the type enumerator, the typedef, and the
> helper-head.h macros.
>
> This cannot yet be used, because you can't allocate
> temporaries of this new type.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

