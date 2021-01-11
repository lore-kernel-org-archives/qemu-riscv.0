Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kyyhB-0001AI-Ea
	for mharc-qemu-riscv@gnu.org; Mon, 11 Jan 2021 10:01:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyyh8-00014f-UA; Mon, 11 Jan 2021 10:01:22 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:43592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyyh7-0001Ow-8o; Mon, 11 Jan 2021 10:01:22 -0500
Received: by mail-ed1-x530.google.com with SMTP id y24so19106973edt.10;
 Mon, 11 Jan 2021 07:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H7jli1x205TCwQLs1TIelXiSiL+UVcSYK0tSgScIb9s=;
 b=Mvp7q2JNh+qjcoH8WA3zveMCBugZfpKO+R8qbaB+c8BlZSuw43ZflcPnb2GdDCuc9v
 fqxQGYYJy/AQ0Y/krxvyi4dQbUwBZOadY2tuG7JmN+cghevKeB+gIKhQpkrGJNEDwp3R
 tU79sO1gMD4VpM+E+bhO3wDi1JwVj+E/+KoAiVWf4zOCWCGIqzI+xJFj1X24Qgkz8id8
 whqrdquEItKVsw32lurGNFqgTTHdY1CIhRj7a+jjIpDAGNtOFbfeDT3N52CexpFRwLGm
 vRjWgid9sJ5Fcq+TughpyzuaMQXLUlxczxOVMLRyT7CkQZmS4aTgLga4n75IcaDhek40
 Gnkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=H7jli1x205TCwQLs1TIelXiSiL+UVcSYK0tSgScIb9s=;
 b=ZcG/PVuYfOKlkcBBBIT34KivYCs7aS6zUH1Vif+iUuM4IXB7ygHgEm03DlhqFkahqb
 lI7fFsxpqO+ACdHv+3o4QA1iClXdVwQCCwPCymFZUcWVEgcX8K+AwWlUmoQSN8sDTYUF
 dWYeU+Z7B1FcdyLun7a3BV3qn2XnFjY3V6IcigXcb6AOHmN9KtgcLwWTOsI7I5XXvMY7
 ALM9FFOjWI/EhdvbIHJM3ofzuUmR98EqkFg5Y2VQhbitrabD7m+fNPNz7S/MQo88onEM
 U5XgOPXDJJ3JrbiOxlGYAFakg5mvd65DgcFn+kmZgR6nb9hHVztYKJkiFPjeKyFZxfi1
 kpPA==
X-Gm-Message-State: AOAM532Br68SU+utVCWPzMftGh/BdUhf64Aoh2E3KBomQ9wzRzC2Oa5F
 NoqNJUYnxquO4mPYZBB+jOukSN8BQqA=
X-Google-Smtp-Source: ABdhPJzVLIWhs0tSp57hSIfVEDWpQTdEePi2WMWha2s59OyxRuhQGzfMbYvToU9Ov0tf/PcYaftLAQ==
X-Received: by 2002:a05:6402:1714:: with SMTP id
 y20mr13989485edu.360.1610377278262; 
 Mon, 11 Jan 2021 07:01:18 -0800 (PST)
Received: from x1w.redhat.com (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id p24sm45023edr.65.2021.01.11.07.01.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 07:01:16 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Andrzej Zaborowski <balrogg@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 0/5] tcg: Restrict tcg_out_op() to arrays of TCG_MAX_OP_ARGS
 elements
Date: Mon, 11 Jan 2021 16:01:09 +0100
Message-Id: <20210111150114.1415930-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Mon, 11 Jan 2021 15:01:23 -0000

Attempt to fix the warning reported by Miroslav using GCC 10:=0D
https://www.mail-archive.com/qemu-devel@nongnu.org/msg771520.html=0D
=0D
Philippe Mathieu-Daud=C3=A9 (5):=0D
  tcg/arm: Hoist common argument loads in tcg_out_op()=0D
  tcg/ppc: Hoist common argument loads in tcg_out_op()=0D
  tcg/s390: Hoist common argument loads in tcg_out_op()=0D
  tcg: Restrict tcg_out_op() to arrays of TCG_MAX_OP_ARGS elements=0D
  tcg: Restrict tcg_out_vec_op() to arrays of TCG_MAX_OP_ARGS elements=0D
=0D
 tcg/tcg.c                    |  19 ++-=0D
 tcg/aarch64/tcg-target.c.inc |   3 +-=0D
 tcg/arm/tcg-target.c.inc     | 173 ++++++++++----------=0D
 tcg/i386/tcg-target.c.inc    |   6 +-=0D
 tcg/mips/tcg-target.c.inc    |   3 +-=0D
 tcg/ppc/tcg-target.c.inc     | 297 +++++++++++++++++------------------=0D
 tcg/riscv/tcg-target.c.inc   |   3 +-=0D
 tcg/s390/tcg-target.c.inc    | 252 ++++++++++++++---------------=0D
 tcg/tci/tcg-target.c.inc     |   5 +-=0D
 9 files changed, 372 insertions(+), 389 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

