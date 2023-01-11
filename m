Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFW1h-0008Cd-1R
	for mharc-qemu-riscv@gnu.org; Wed, 11 Jan 2023 03:00:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFW1b-00088r-OH
 for qemu-riscv@nongnu.org; Wed, 11 Jan 2023 02:59:57 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFW1Y-0007GX-V7
 for qemu-riscv@nongnu.org; Wed, 11 Jan 2023 02:59:55 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so8892238wma.1
 for <qemu-riscv@nongnu.org>; Tue, 10 Jan 2023 23:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Za7c5P/ZM53XI/7OYXXkX7JAqvbWLwDEhHNvtKksAME=;
 b=gLlgmtZ0QKKlNfSWRxY/tDuxk+0WhzIVN2zKG7qjDoVs06UOOw9CW8VEIpfl4O4EZp
 AiWaMPFvUCI+zjGLb2Wd2c1NbD5qXSV0+Uv211n+FB/nmu7J2xvncYHhQXcVUQYtYDb4
 4UgUVj6/AKa5jegiD9kiplp+l0OoKHgRD7aJJp4H+Js7nYsC0+uDcs/A8NGeFRFMH63c
 BRxadxK8hhGh7tUE/8LrzVJsrnaX4tgukkonpvLbH6K3+CCSCaQ+VsvvqBWGsrhl8HoU
 IlRwSTmwbLgIrEbfJmKJMeH0FwQCNsI8Q7xDMWApsqMs0aDND+lKTyfZkaMmSWb2oeg4
 pVqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Za7c5P/ZM53XI/7OYXXkX7JAqvbWLwDEhHNvtKksAME=;
 b=aDpFeNcBPlsU+W+LCRlmQz8B/hUwqLaNlMfiru/Y6l+WD70W8436ZiOpPSgSz7Xxco
 xAR56xDjmquZZL3wRNQ8oggVz+5Dc7uvN/uTEq6pzgct+wr2/HW2ZN5O0Z4DmKk4rdxA
 ILcTaCl+ZKTTjL7PB+7c6qQTVCZyreRadIUhE/pay69AYqyNBnW4FS1It0HJgMOOp3uI
 OmUizhY9/D4sn67UkPtuVasct0M+f9ncUwZQXQWDUj887AMtmT66GGzt3/9oLdSm+ZSA
 Q8OK5t7XYDiGglTBGj+UDgaT1G120nLUN6XmHQafaoKUZK70MTa5bHQrEWwn8jVZjDzg
 E9Dg==
X-Gm-Message-State: AFqh2kq+K+HbbdjqB/sKILdAFvilkb1PCBIpkIoyF4JI0BVdO/99RR6z
 ZJw84XR+4nSeNsutDNoIWLR1iA==
X-Google-Smtp-Source: AMrXdXtCDk5GDGw2AhTuqoj0oy8ZB1EqtrD4qa0QYNS+Eqk57YV70E2XjToFOwBG4I4Rvk0Msgy8Lg==
X-Received: by 2002:a05:600c:3b90:b0:3d1:f0f1:ceb4 with SMTP id
 n16-20020a05600c3b9000b003d1f0f1ceb4mr51358090wms.19.1673423991028; 
 Tue, 10 Jan 2023 23:59:51 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 q20-20020a7bce94000000b003c6c3fb3cf6sm17137340wmj.18.2023.01.10.23.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 23:59:50 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0BD9E1FFB7;
 Wed, 11 Jan 2023 07:59:49 +0000 (GMT)
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
 <20230108023719.2466341-3-richard.henderson@linaro.org>
User-agent: mu4e 1.9.12; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v4 02/36] tcg: Handle dh_typecode_i128 with
 TCG_CALL_{RET, ARG}_NORMAL
Date: Wed, 11 Jan 2023 07:59:41 +0000
In-reply-to: <20230108023719.2466341-3-richard.henderson@linaro.org>
Message-ID: <874jsxmrgr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
X-List-Received-Date: Wed, 11 Jan 2023 07:59:59 -0000


Richard Henderson <richard.henderson@linaro.org> writes:

> Many hosts pass and return 128-bit quantities like sequential
> 64-bit quantities.  Treat this just like we currently break
> down 64-bit quantities for a 32-bit host.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

