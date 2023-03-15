Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pcVAB-00025b-L8
	for mharc-qemu-riscv@gnu.org; Wed, 15 Mar 2023 13:43:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcVA8-00020F-40
 for qemu-riscv@nongnu.org; Wed, 15 Mar 2023 13:43:44 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcVA0-0000cm-CD
 for qemu-riscv@nongnu.org; Wed, 15 Mar 2023 13:43:43 -0400
Received: by mail-wr1-x429.google.com with SMTP id m2so5282085wrh.6
 for <qemu-riscv@nongnu.org>; Wed, 15 Mar 2023 10:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678902214;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y4cpR7vA6XSXxWS6bHag8gq4h8YFalbW/SrKcN6qWB8=;
 b=gb53RexSl8PB4IaOOG9vTrd+3BcQN0+X2Am1jwD+RpD/rPEOKxUfXSzSe4DYauDoAq
 BwfNcPM8KY6JvnQDUHY8DT1a2Pfcdi8XOIC09K8wbEN8O4vtpMXc84nHnMoAxKVz5XyI
 tl6psBNX6/vGm1pZbEPVmGtME5UQZqlkf8f1ggfc+Ip9lbnFapBhBBEnfMxOf+VWfAyO
 Hp+Uz+k0VMlEgUUmnuUzVttOxbO7IHeQPF2i64pBiNfzLgXIrWnqXT5997lsKogM5Hx2
 KUEHwjinTWn6LdBjwPAtR0KxKxLSMSJ34L3EhUBA72mCVUM64sj3Fej/wxBuwYHz0Ph4
 DiLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678902214;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y4cpR7vA6XSXxWS6bHag8gq4h8YFalbW/SrKcN6qWB8=;
 b=gECcMlJDnx6qGVxJcezciOZp/2zSZ0IAOTzkShHEFn5+KRGSxE4X2OIGrIR3usiZ7f
 /bjq4QbBcf0CXdkWsP9C0GDWH39RJFgIzOHzdI4GKNms+CBLnL1LUqzKbR2ULe9Ali4f
 0GS+/kIjr7Md2rcSYOLNW7Yb/auCvVAw2sH1rhhn3hKvja/RNgUuW4C33ZCcsuBuA14+
 wOthEVPFj29886i+9lkwXxv2fwKuP+XHk4aELBdda3jhEQoGUZfnopaT+d5aE3nxxWhP
 ybNx32ye0QIbu5T6+83mM7hRFLsE0f0r8wVQasJ7bRXxdTXlmPY3tlBfUmxbXBPTtg4y
 Xh2Q==
X-Gm-Message-State: AO0yUKXr2QZbbWhoqFZeIPY4ZCeXn6jgezZsK3iT+5TFwSYjiZ7CeU4D
 th5HeZ20y8AwP65N3wzre4bOSw==
X-Google-Smtp-Source: AK7set9LElPNTXQiqOj+0ADODBobuAuRsu2Z5RFM9zCJWgYF1lFYWqWlOkJK+PxZbCiaZo7r224tiQ==
X-Received: by 2002:a5d:6a4a:0:b0:2cf:3a99:9c1e with SMTP id
 t10-20020a5d6a4a000000b002cf3a999c1emr2611776wrw.49.1678902214472; 
 Wed, 15 Mar 2023 10:43:34 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a5d4847000000b002c5d3f0f737sm5190409wrs.30.2023.03.15.10.43.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 10:43:33 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8D4A31FFBB;
 Wed, 15 Mar 2023 17:43:31 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-riscv@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
 Igor Mammedov <imammedo@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Hao Wu <wuhaotsh@google.com>,
 Cleber Rosa <crosa@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-arm@nongnu.org, Marcelo Tosatti <mtosatti@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Alexandre Iooss <erdnaxe@crans.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-ppc@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Darren Kenny <darren.kenny@oracle.com>, kvm@vger.kernel.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stafford Horne <shorne@gmail.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Vijai Kumar K <vijai@behindbytes.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Gibson <david@gibson.dropbear.id.au>, Song Gao <gaosong@loongson.cn>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Greg Kurz <groug@kaod.org>,
 Laurent Vivier <laurent@vivier.eu>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Alexander Bulekov <alxndr@bu.edu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-block@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, David Woodhouse <dwmw2@infradead.org>,
 qemu-s390x@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Bandan Das <bsd@redhat.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Tyrone Ting <kfting@nuvoton.com>, Kevin Wolf <kwolf@redhat.com>,
 David Hildenbrand <david@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Paul Durrant <paul@xen.org>,
 Bin Meng <bin.meng@windriver.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Hanna Reitz <hreitz@redhat.com>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 03/32] scripts/ci: add libslirp-devel to build-environment
Date: Wed, 15 Mar 2023 17:43:02 +0000
Message-Id: <20230315174331.2959-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315174331.2959-1-alex.bennee@linaro.org>
References: <20230315174331.2959-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
X-List-Received-Date: Wed, 15 Mar 2023 17:43:44 -0000

Without libslip enabled we won't have user networking which means the
KVM tests won't run.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 scripts/ci/org.centos/stream/8/build-environment.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/ci/org.centos/stream/8/build-environment.yml b/scripts/ci/org.centos/stream/8/build-environment.yml
index 0d094d70c3..1ead77e2cb 100644
--- a/scripts/ci/org.centos/stream/8/build-environment.yml
+++ b/scripts/ci/org.centos/stream/8/build-environment.yml
@@ -55,6 +55,7 @@
           - librados-devel
           - librbd-devel
           - libseccomp-devel
+          - libslirp-devel
           - libssh-devel
           - libxkbcommon-devel
           - lzo-devel
-- 
2.39.2


