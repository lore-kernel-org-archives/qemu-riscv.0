Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ntWjg-0002dz-07
	for mharc-qemu-riscv@gnu.org; Tue, 24 May 2022 11:46:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ntWja-0002Wx-AL
 for qemu-riscv@nongnu.org; Tue, 24 May 2022 11:46:11 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:38407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ntWjY-0006CA-1r
 for qemu-riscv@nongnu.org; Tue, 24 May 2022 11:46:09 -0400
Received: by mail-ed1-x532.google.com with SMTP id p26so23598435eds.5
 for <qemu-riscv@nongnu.org>; Tue, 24 May 2022 08:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=sIbaY8ZKt1Z7HL5Scv272Yrd5GAJzQ+u1B+IktUW/Tw=;
 b=MHUDtgebx2pSsxKLs5gwbI2JVMqVrjP4KSSgGWseoBRb4xbeHsifMlkVaTifQyW2Zk
 UYZ7aU6zc0W4gjv9a9hGOzRiDk7yT+ucrRbwEaO45Mm5i/1Y/m30x6tWaNU6mgzhsGqU
 CapRApVxcQnCP2wsJWDP9kYZwuVoW5PgqGOGEul/b+ncIdgDV/E2IYMazXIfhnfvpifA
 AuqzQnn0Qg2ASU793722sf2/ahM0ITLw3ZFC08lKyoJgciY4aLnHhZ8Q9zpQFRdbHTwy
 SCugTY6tKOaPY/f9NUXK4hgvYMcTHFTdiF+3QwLR5kcyV45BrVeYshkjF038WNPkuRgq
 EYDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=sIbaY8ZKt1Z7HL5Scv272Yrd5GAJzQ+u1B+IktUW/Tw=;
 b=NMxYjzCHcadeAznyTXQjdDPwKSMXpFWVnUK8enbJpGL4ZycBxnWTIVwXqf4g630lTs
 w4WRPzZbdkiJwznhQCH1PGVMsYVvUjanG+QbEP6tZPDCUyrYCfk1DuYteubfWaUNtIUV
 nrVegGjcOAQ1hU7jgwbeleWiAihXUK6QKSQdoOGease6N3T5LkMrC38OEK6ZSDgHfaKe
 fdO4AESaB2sfn5hkCN44/nepIJUOzBkPUQ0HxrEATh5P/H9sDQbJugw3QY9BcVORbamK
 pUcGOZNgwPuUhXXUF6Qfa/eTH7N+/xy9yCaaiWrAZ7RgGTRmaFdQmgisfUYH3c8JvSyN
 b2dg==
X-Gm-Message-State: AOAM531zbcyhktdWANl1668N0JpBhFzKZ5BzH8hhsVru9VLWUsY/oS+u
 PZV7FD31hiY0EGMAa/MK060dsQ==
X-Google-Smtp-Source: ABdhPJwc3Dyn5vh0V1l0ThTWqfiL+IUWpdSQbh237QyY1CmQ0ijvyDQSCeHrgd8evdcg2LwygBTmQQ==
X-Received: by 2002:a05:6402:31e5:b0:42a:b724:c567 with SMTP id
 dy5-20020a05640231e500b0042ab724c567mr29469935edb.347.1653407165449; 
 Tue, 24 May 2022 08:46:05 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 jp10-20020a170906f74a00b006feec47dae9sm2012420ejb.157.2022.05.24.08.46.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 08:46:04 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0EA241FFBA;
 Tue, 24 May 2022 16:46:04 +0100 (BST)
References: <20220524093141.91012-1-thuth@redhat.com>
User-agent: mu4e 1.7.23; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Wainer
 dos Santos Moschetta <wainersm@redhat.com>, Beraldo Leal
 <bleal@redhat.com>, qemu-riscv@nongnu.org
Subject: Re: [PATCH] .gitlab-ci.d/container-cross: Fix RISC-V container
 dependencies / stages
Date: Tue, 24 May 2022 16:45:58 +0100
In-reply-to: <20220524093141.91012-1-thuth@redhat.com>
Message-ID: <87czg36iis.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x532.google.com
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
X-List-Received-Date: Tue, 24 May 2022 15:46:12 -0000


Thomas Huth <thuth@redhat.com> writes:

> The "riscv64-debian-cross-container" job does not depend on any other
> container job from the first stage, so we can move it to the first
> stage, too.
>
> The "riscv64-debian-test-cross-container" job needs the debian11
> container, so we should add a proper "needs:" statement here.

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

