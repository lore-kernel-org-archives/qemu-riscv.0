Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nHR7C-0004C7-7a
	for mharc-qemu-riscv@gnu.org; Tue, 08 Feb 2022 09:05:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liyu.yukiteru@bytedance.com>)
 id 1nHQDY-00025f-U9
 for qemu-riscv@nongnu.org; Tue, 08 Feb 2022 08:07:36 -0500
Received: from [2607:f8b0:4864:20::1034] (port=43653
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liyu.yukiteru@bytedance.com>)
 id 1nHQDT-0000JQ-Uz
 for qemu-riscv@nongnu.org; Tue, 08 Feb 2022 08:07:33 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 t14-20020a17090a3e4e00b001b8f6032d96so1458603pjm.2
 for <qemu-riscv@nongnu.org>; Tue, 08 Feb 2022 05:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:to:cc:from:subject
 :content-transfer-encoding;
 bh=9VVXLv9TyUydx6CgAjhNGzuxF7/DiDjXDAwDUWWiWzA=;
 b=xRl0wDP+zkzmNoLVh14/ZRr0d8QAbrCaxSpQ7rCZq8FUfEJScToJ0sehyvuz0Tj1bF
 prPDlVti4gbQ0HG9T2jdrIIYAuy8CRqnNewy3sW+WmJ+I3jqcE1YlkahzKjdaznWFDMC
 rdaZh9t9INw/JG7ab9XXugycXROaZ6XA1f2SSyr2qD5RWKcrqKMNqGTs3WXrxrO+BVBh
 2xzUBzM3QnHntdaJlLV4m8eaaM+3lG9UxXrWT81oUQ6A2YffgbUky/6NAUHbEY6VFp+n
 Ftkqhlrv1t1zxDwtYd1zHdt3/JULUsAKzo/YdCdJlr4I0iHYpj/LIPElDoc+cPsVO8lC
 QI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:to:cc
 :from:subject:content-transfer-encoding;
 bh=9VVXLv9TyUydx6CgAjhNGzuxF7/DiDjXDAwDUWWiWzA=;
 b=oPHuDvkGpzP+Z87CxBgc/Ro9fUWzucU1bSJH4+/MTHSJivWUJkhIDw6HsQy3ZBOvEQ
 fi1xY2MHB1mNI/SgGB7agl2Gyx59gzV3DuNGKBCHqQ9js2bQYJ1yw4nMSUvKHI0btoAZ
 vt6mzlZ13O3MYcF824pljnNru7JR94ToMhe18wLS3LZf6o4asa3Sg6psUS62EDL3L4Bg
 eTnqN6EkKED749e6IodhtYdj7aAlz8bdgWa4IGk3TJTv4FOMuMQFHjgffrCva+HCtuU6
 kOSwFu6HOB50whOOh44iGbFqyb2ZODkGWMVKYWgX/Of+0GIWfLxtbtEwSdaUaWmdtt/8
 gxIQ==
X-Gm-Message-State: AOAM53280/K+dae1C2NI/N44H3yH7ufuDvMHohJrMHDbAg/N7sxc000Z
 gqdcb4Yp/ITB0UKKh1ehT955Uw==
X-Google-Smtp-Source: ABdhPJwu1tS82V3naUaMqFuWAnnxxGM0cseEvS4MIfLwi6FwMC2VfrKuILsqp3mgISeyZyWWfqozsg==
X-Received: by 2002:a17:902:f549:: with SMTP id
 h9mr4626554plf.62.1644325648814; 
 Tue, 08 Feb 2022 05:07:28 -0800 (PST)
Received: from [10.87.51.42] ([139.177.225.229])
 by smtp.gmail.com with ESMTPSA id s84sm11625532pgs.77.2022.02.08.05.07.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 05:07:28 -0800 (PST)
Message-ID: <9040401e-8f87-ef4a-d840-6703f08d068c@bytedance.com>
Date: Tue, 8 Feb 2022 21:07:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, bmeng.cn@gmail.com, liyu.yukiteru@bytedance.com
From: Yu Li <liyu.yukiteru@bytedance.com>
Subject: [PATCH] docs/system: riscv: Update description of CPU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=liyu.yukiteru@bytedance.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 08 Feb 2022 09:05:04 -0500
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
X-List-Received-Date: Tue, 08 Feb 2022 13:07:37 -0000

Since the hypervisor extension been non experimental and enabled for
default CPU, the previous command is no longer available and the
option `x-h=true` or `h=true` is also no longer required.

Signed-off-by: Yu Li <liyu.yukiteru@bytedance.com>
---
  docs/system/riscv/virt.rst | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
index fa016584bf..08ce3c4177 100644
--- a/docs/system/riscv/virt.rst
+++ b/docs/system/riscv/virt.rst
@@ -23,9 +23,9 @@ The ``virt`` machine supports the following devices:
  * 1 generic PCIe host bridge
  * The fw_cfg device that allows a guest to obtain data from QEMU

-Note that the default CPU is a generic RV32GC/RV64GC. Optional extensions
-can be enabled via command line parameters, e.g.: ``-cpu rv64,x-h=true``
-enables the hypervisor extension for RV64.
+The hypervisor extension has been enabled for the default CPU, so virtual
+machines with hypervisor extension can simply be used without explicitly
+declaring.

  Hardware configuration information
  ----------------------------------
-- 
2.20.1

