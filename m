Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pXf1X-0007O4-F4
	for mharc-qemu-riscv@gnu.org; Thu, 02 Mar 2023 04:14:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pXf15-0006S6-Td
 for qemu-riscv@nongnu.org; Thu, 02 Mar 2023 04:14:24 -0500
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pXf12-0007Z5-H8
 for qemu-riscv@nongnu.org; Thu, 02 Mar 2023 04:14:23 -0500
Received: by mail-ot1-x333.google.com with SMTP id
 r23-20020a05683001d700b00690eb18529fso9158854ota.1
 for <qemu-riscv@nongnu.org>; Thu, 02 Mar 2023 01:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1677748453;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=z5c2bQOwrWxvvs9nR+nbGDX2izdNRL4cC/XCJgSGPHg=;
 b=HfOJzupwH5OUPi/UpKiRKxV9aRq1h2vy3NNxS2ZuL88uRD5FaNv+y2hK0ABwwLiIAS
 hK3IXckU1iHrpioL3RvxmdtCkanU+oS/S03+rL2InPWixqmfW72sbDNn5SK9Cnyg3eUV
 ZlzmdTzHogrceAinRGmXZbku5wHuyPkcuKGwa9pqEZHV3/sswfxqNErj/naZzEQgrKC1
 DWQ9KHE8e3JmZlQ7OVvCQAIaFUwE5sEETkrUVRPgkdWXcd5ybnnGx1PzyRCQKe42FGeR
 HGk7XJw/b6pI3Sj4mrT6OW1SO9vsqOqh4u7/UMV7rJDhB9Rs9ejrILC7GjTNKv+27PKi
 mXhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677748453;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z5c2bQOwrWxvvs9nR+nbGDX2izdNRL4cC/XCJgSGPHg=;
 b=zrxoTQvU+WA38AYj9ZAsSGfMwjXWbEddiOfWnStinMKsGKLME/8Z+rgoeoHv3nd3XA
 L12fu3aY0xd/v/f9eZ8BIaFKCmiJFkYrnt24KEHZoNTyh/WIOi1i2/X0skYwNaaCWj1H
 0cv/y8g+1djS7RQ00/+TxK+RaIfSJKHPFA/HnOcff0SvirrotQoJPO/1o5yXSZp+joiZ
 dP4cRuMftC3fGGg6mNk3T8A3dDYkSDw9dcK7w7wxUIMEXQP0as9qUQAWjqea4n4MLW3M
 g4sOKK+7Cw1hV5lgqDdivVVhwrrIDjm9y+1wm9C+azHQpmL0vAkxqU7VXHMu+FmPKYWT
 ZwLA==
X-Gm-Message-State: AO0yUKUuIhlQKYtGPJberXI2tr0PPhH4XtFKDqMvLqHD9VM/O60laz4p
 1nyZtH5lRkstcufFQYOG1hxB7w==
X-Google-Smtp-Source: AK7set9MR82DqHps3T2KC+zZcy0HTf0dxChuaAmmOyg1DL4mezCga3ZI7Gt4bmQt4BLpyF+HsBGLzA==
X-Received: by 2002:a9d:684a:0:b0:693:c20e:5655 with SMTP id
 c10-20020a9d684a000000b00693c20e5655mr754602oto.4.1677748453143; 
 Thu, 02 Mar 2023 01:14:13 -0800 (PST)
Received: from grind.. ([177.189.53.31]) by smtp.gmail.com with ESMTPSA id
 v15-20020a9d7d0f000000b006864c8043e0sm5641793otn.61.2023.03.02.01.14.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 01:14:12 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH v2 0/1] hw/riscv/virt.c: add cbo[mz]-block-size fdt properties
Date: Thu,  2 Mar 2023 06:14:05 -0300
Message-Id: <20230302091406.407824-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x333.google.com
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
X-List-Received-Date: Thu, 02 Mar 2023 09:14:25 -0000

Based-on: 20230224132536.552293-1-dbarboza@ventanamicro.com
("[PATCH v8 0/4] riscv: Add support for Zicbo[m,z,p] instructions")

Hi,

This second version, which is still dependent on:

[PATCH v8 0/4] riscv: Add support for Zicbo[m,z,p] instructions

Is adding the cboz FDT property as well as requested by Ben Dooks. First
version refrain from adding it since it's still under review in the
kernel but, given that we have cboz_blocksize already available, it
makes sense to also expose it like we're already doing for
cbom-block-size.

Changes from v1:
- also add riscv,cboz-block-size for Zicboz
- v1 link: https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg00368.html

Cc: Ben Dooks <ben.dooks@codethink.co.uk>

Anup Patel (1):
  hw/riscv/virt.c: add cbo[mz]-block-size fdt properties

 hw/riscv/virt.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

-- 
2.39.2


