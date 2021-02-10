Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l9rvM-0003Ri-MR
	for mharc-qemu-riscv@gnu.org; Wed, 10 Feb 2021 11:01:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <billa.iitmadras@gmail.com>)
 id 1l9mSa-0000NM-1W
 for qemu-riscv@nongnu.org; Wed, 10 Feb 2021 05:11:00 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:42206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <billa.iitmadras@gmail.com>)
 id 1l9mSU-00038Y-0P
 for qemu-riscv@nongnu.org; Wed, 10 Feb 2021 05:10:59 -0500
Received: by mail-ed1-x52e.google.com with SMTP id z22so2202421edb.9
 for <qemu-riscv@nongnu.org>; Wed, 10 Feb 2021 02:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=7aZ202wcvzhDpLjUp4lPdOTmn4ovW8g57iqaQHC40Cw=;
 b=viODTkE9lJf2xIDmRn9KCKEZ3XEvrTadMyMHW8rQNkNW9jtxSwzpZKFWmpvj2RysaH
 DxXupQxRCjeiaqCYuRPUoctsNjhkIkSiL7x9c8BLxqgKYfkoCikV8wOxBG+LZXiYGB6p
 z8y84p5VlMTyAAWfr7tyz0lGRSoH3Kuvm8sYcvl2XRSkp6ul/kSKKVeEdh2HjQVXiB+5
 pmLqEmm9SSIblwufqim20/FKTd03YwQXZDycURW/v1nl7/pc/9VyKAXnO42cGePcPbHG
 7YvSgDa9qDphZFQpnmkp+nm2g/YSOTJJiDP8r7ikk72EL8Cx25t0CaGnObWAWGj3O3cA
 FRaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=7aZ202wcvzhDpLjUp4lPdOTmn4ovW8g57iqaQHC40Cw=;
 b=qY2FraARZjg/6IkDKEWqxbCapTV/Picftg7RbGe7nBo39GtJ2O+liyqpHE/qsX8qqS
 aqjzsIcnviZtU80z2rPmAgls7UiG/x8F0qjRes6/nYlC+3L/XCZn/lvEvmFtcTvEiBnb
 g9bQ7Fh308LjY4QAxoIW2fhZ0k15M16uhAQHL3VuFihVQ7dt6g+t3HZXJKdyjptBjByL
 Sq3ySp4IEyjtgUCx4QPCUKGotGn+mPVvmLumI7KS+zeEfmsoUYkpWXGFlxUdWk5h2Z1A
 /h2tdMemYjrAjmRyqYWn38r6qZc+kcaI3FKaBU3nSfYd7pkUqETJ2wlGIl2YARIRzDQA
 FPCA==
X-Gm-Message-State: AOAM530Z8FqKkjBTEpa38WAoLmvxze85tS8rpth26es1uxFlyWvDwK3i
 EAnZJLkS/H/b8N8JWUq+zjl8SDXsKBQGs8XX+xfZ06qQSbY=
X-Google-Smtp-Source: ABdhPJwl5hCmO7SDzEJGOSelf9gGmozuRvlIrVSM2usisr5lYi78gLLn+JTcz5V8pEzR2XzZgmq2RBQWfUFgZBk1KA8=
X-Received: by 2002:aa7:cd8d:: with SMTP id x13mr2403040edv.286.1612951851599; 
 Wed, 10 Feb 2021 02:10:51 -0800 (PST)
MIME-Version: 1.0
From: Billa Surendra <billa.iitmadras@gmail.com>
Date: Wed, 10 Feb 2021 15:40:35 +0530
Message-ID: <CAKBF_5qGScpAzeaJKHs4102nqVCmjmNq05EXLHLbLPV9tXBd9g@mail.gmail.com>
Subject: qemu support for rv64imafd/rv64imafdc
To: qemu-riscv@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000278aac05baf89e91"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=billa.iitmadras@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_20=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 10 Feb 2021 11:01:02 -0500
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Feb 2021 10:11:00 -0000

--000000000000278aac05baf89e91
Content-Type: text/plain; charset="UTF-8"

Dear all,

Does riscv qemu support  both kernel image generated with RV64IMAFD
extensions and Image generated with RV64IMAFDC ?. If the answer is yes, how
is it supporting both ?. Please reply to my question if anyone knows.

Thanks in advance
Billa

--000000000000278aac05baf89e91
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Dear all,</div><div><br></div><div>Does riscv qemu su=
pport=C2=A0 both kernel image generated with RV64IMAFD extensions and Image=
 generated with RV64IMAFDC ?. If the answer is yes, how is it supporting bo=
th ?. Please reply to my question if anyone knows.</div><div><br></div><div=
>Thanks in advance</div><div>Billa<br></div><div><br></div></div>

--000000000000278aac05baf89e91--

