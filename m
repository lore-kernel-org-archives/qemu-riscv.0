Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pKn5S-000796-S9
	for mharc-qemu-riscv@gnu.org; Wed, 25 Jan 2023 16:13:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKn5P-00075b-49
 for qemu-riscv@nongnu.org; Wed, 25 Jan 2023 16:13:40 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKn5N-00086C-3m
 for qemu-riscv@nongnu.org; Wed, 25 Jan 2023 16:13:38 -0500
Received: by mail-wr1-x42a.google.com with SMTP id r2so18337875wrv.7
 for <qemu-riscv@nongnu.org>; Wed, 25 Jan 2023 13:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1rhIEXn0pLuoc5qeKsCE66/f36q7EcfKoWih67jlqRc=;
 b=t0KnwWJAql55WRy4VNQhg4iHSJA/Z+HxSdfycFhUqj8rwWzSzF7mhYsgcsLoKx/dlT
 JDZnlSScs8J+WkgZUuIiNCHNgNdKw4Xpv7IZvGOHTn7VeyCzLiwHe01e7dXbjxq9YVvc
 6OVOFZYJMDC2NDhBOcSw2C1Ei/DTQIijvvlG0B+Oob+OM07lvelbzw8mlhL2EtAOaI5f
 pugsd/jU0JzQikxb+wW69+WhYQhqtsLtELJDk730JhUZJA+t9IRruANp0BKpMfwNh6+M
 2HTY7Zrybax1XJ8kAibnxthFaFwBUQTQga3wDPTMtUBhB2Sx1k3qLzcrItDBGlWqGmBB
 rH+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=1rhIEXn0pLuoc5qeKsCE66/f36q7EcfKoWih67jlqRc=;
 b=1Xz/kA8lgrxrfF4CoB67UtlAk4Jcaj6nOOGxboUTU193xfseS1BlHo+8b+uZCZfHGf
 ppC6J3RDT/GuM4BMHcnttQgu8IL1NT52YhIWHKuNUdSkRZxnu2RjObF0CcWNv595wIBv
 6tKBQJ1kZ4a3D59DzStl06nTgJAz26ts9VyfHbJ3nyQJedvuRjJEvOAfbbLilW/g02ha
 b9niVXw25QzkwsG4l93mZlgoyCgAjwu48FN6/z5nlXUt4KI6Lwwchnj6zRxHbujKviwq
 wYD1BukwxOQpUnVsJSNpN69+efXFpbOIlqJtYdZaS2chcosRB+6tBB1R87El655UeLRt
 3pAQ==
X-Gm-Message-State: AFqh2ko/33/JgWs5PjmJ0n+HZ8lClPXOc1jEYixfXVQgmgJEQ90G9w3E
 yrqaDKVsgpgsIFPAohKStLsK0w==
X-Google-Smtp-Source: AMrXdXs8K04BkAmYGGOB3ozwhu/qJwHs+UNMN2as9ghMk+SvxeJoItXE+OwG97BDzTONwtdfxQyYxg==
X-Received: by 2002:a05:6000:1049:b0:242:15d6:1a75 with SMTP id
 c9-20020a056000104900b0024215d61a75mr26404607wrx.66.1674681215488; 
 Wed, 25 Jan 2023 13:13:35 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bj7-20020a0560001e0700b002bfb5618ee7sm3692468wrb.91.2023.01.25.13.13.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 13:13:35 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 86BB71FFB7;
 Wed, 25 Jan 2023 21:13:34 +0000 (GMT)
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
 <20230108023719.2466341-8-richard.henderson@linaro.org>
User-agent: mu4e 1.9.16; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v4 07/36] tcg: Add TCG_CALL_RET_BY_VEC
Date: Wed, 25 Jan 2023 21:13:30 +0000
In-reply-to: <20230108023719.2466341-8-richard.henderson@linaro.org>
Message-ID: <87357yqpvl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
X-List-Received-Date: Wed, 25 Jan 2023 21:13:40 -0000


Richard Henderson <richard.henderson@linaro.org> writes:

> This will be used by _WIN64 to return i128.  Not yet used,
> because allocation is not yet enabled.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

